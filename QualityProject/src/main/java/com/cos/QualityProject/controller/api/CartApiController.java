package com.cos.QualityProject.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.QualityProject.config.auth.PrincipalDetail;
import com.cos.QualityProject.dto.ResponseDto;
import com.cos.QualityProject.model.QualityOrder;
import com.cos.QualityProject.service.CartItemService;


@RestController
public class CartApiController {
	
	@Autowired
	private CartItemService cartItemService;
	
	@PostMapping("/api/cart/{id}")
	public ResponseDto<Integer> save(@PathVariable int id,@AuthenticationPrincipal PrincipalDetail principal) {
		cartItemService.toSave(id,principal);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/cart/deleteById")
	public ResponseDto<Integer> deleteById(@RequestBody QualityOrder order){
		String itemIds[] = order.getItemIds().split(",");
		for(int i =0;i < itemIds.length;i++) {
		cartItemService.toDelete(Integer.parseInt(itemIds[i]));
		}
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/cart/deleteAll")
	public ResponseDto<Integer> deleteAll(@RequestBody QualityOrder order){
		String itemIds[] = order.getItemIds().split(",");
		for(int i =0;i < itemIds.length;i++) {
		cartItemService.toDelete(Integer.parseInt(itemIds[i]));
		}
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}

}
