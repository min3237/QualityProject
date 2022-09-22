package com.cos.QualityProject.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.QualityProject.config.auth.PrincipalDetail;
import com.cos.QualityProject.dto.ResponseDto;
import com.cos.QualityProject.model.QualityCartItem;
import com.cos.QualityProject.model.QualityOrder;
import com.cos.QualityProject.service.CartItemService;
import com.cos.QualityProject.service.OrderService;

@RestController
public class OrderApiController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartItemService cartItemService;
	
	@PostMapping("/api/order")
	public ResponseDto<Integer> save(@RequestBody QualityOrder order,@AuthenticationPrincipal PrincipalDetail principal) {
		order.setUser(principal.getUser());
		order.setAddress(principal.getUser().getAddress());
		String TotelPrice = order.getTotalPrice();
		order.setTotalPrice(TotelPrice.replaceAll("[^0-9]", ""));
		String itemIds[] = order.getItemIds().split(",");
		for(int i =0;i < itemIds.length;i++) { 
			QualityCartItem cartItem= cartItemService.toDetail(Integer.parseInt(itemIds[i]));
			if(order.getItemNames() == null) {
				order.setOrderTitle(cartItem.getItem().getName()+" 등 "+itemIds.length+"개");
				order.setItemNames(cartItem.getItem().getName());
				order.setPrices(cartItem.getItem().getPrice()+"");
			} else {
				String itemname = order.getItemNames();
				String price = order.getPrices();
				order.setItemNames(itemname+","+cartItem.getItem().getName());
				order.setPrices(price+","+cartItem.getItem().getPrice());
			}
		}
		order.setStatus("주문완료");
		orderService.toSave(order);
		for(int i =0;i < itemIds.length;i++) {
			cartItemService.toDelete(Integer.parseInt(itemIds[i]));
		}
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/order/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id){
		orderService.toDelete(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/api/order/{id}")
	public ResponseDto<Integer> update(@PathVariable int id,@RequestBody QualityOrder order){
		orderService.toUpdate(id, order);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
}