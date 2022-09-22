package com.cos.QualityProject.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.QualityProject.dto.ResponseDto;
import com.cos.QualityProject.model.QualityCartItem;
import com.cos.QualityProject.model.QualityOrder;
import com.cos.QualityProject.model.QualityPayment;
import com.cos.QualityProject.model.QualityQuery;
import com.cos.QualityProject.model.QualityUsers;
import com.cos.QualityProject.repository.UserRepository;
import com.cos.QualityProject.service.CartItemService;
import com.cos.QualityProject.service.CartService;
import com.cos.QualityProject.service.OrderService;
import com.cos.QualityProject.service.PaymentService;
import com.cos.QualityProject.service.QueryService;
import com.cos.QualityProject.service.UserService;

@RestController
public class UserApiController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private QueryService queryService;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartItemService cartItemService;
	
	@DeleteMapping("user/{id}")
	public ResponseDto<Integer> delete(@PathVariable int id) {
		
		List<QualityOrder> orders = orderService.listUp();
		for(int i = 0 ; i<orders.size();i++) {
			if(orders.get(i).getUser().getId() == id) {
				orderService.toDelete(orders.get(i).getId());
			}
		}
		List<QualityPayment> payments = paymentService.listUp();
		for(int i = 0 ; i<payments.size();i++) {
			if(payments.get(i).getUser().getId() == id) {
				paymentService.toDelete(payments.get(i).getId());
			}
		}
		List<QualityQuery> querys = queryService.listUp();
		for(int i = 0 ; i<querys.size();i++) {
			if(querys.get(i).getUser().getId() == id) {
				queryService.toDelete(querys.get(i).getId());
			}
		}
		List<QualityCartItem> cartItems = cartItemService.listUp();
		for(int i = 0 ; i<cartItems.size();i++) {
			if(cartItems.get(i).getCart().getId() == id) {
				cartItemService.toDelete(cartItems.get(i).getId());
			}
		}
		cartService.toDelete(id);
		userService.userDelete(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody QualityUsers user) {
		userService.userJoin(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/user")
	public ResponseDto<Integer> update(@RequestBody QualityUsers user){
		userService.userUpdate(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PostMapping("/auth/idSearch") //주소주소주소주소!!!!!
	public ResponseDto<String> idSearch(@RequestBody QualityUsers user) {
		List<QualityUsers> list=userRepository.findAll();
		for(int i =0; i<list.size();i++) {
			if(list.get(i).getEmail().equals(user.getEmail())){
				if(list.get(i).getName().equals(user.getName())){
					if(list.get(i).getPhone().equals(user.getPhone())){
						return new ResponseDto<String>(list.get(i).getId(),list.get(i).getUsername());
					}
				}
			}
		}
		return new ResponseDto<String>(1,"0");
	}
	
	@PostMapping("/auth/pwdSearch") //주소주소주소주소!!!!!
	public ResponseDto<String> pwdSearch(@RequestBody QualityUsers user) {
		QualityUsers QualityUser= userRepository.findByUsername(user.getUsername())
				.orElseThrow(()->{
					return new IllegalArgumentException("없는 아이디 입니다.");
				});
			if(QualityUser.getEmail().equals(user.getEmail())){
				if(QualityUser.getName().equals(user.getName())){
					if(QualityUser.getPhone().equals(user.getPhone())){
					   QualityUser.setPassword(user.getPassword());
					   userService.userUpdate(QualityUser);
					   return new ResponseDto<String>(QualityUser.getId(),"비밀번호를 재설정했습니다.");
					}
				}
			}
		return new ResponseDto<String>(0,"회원정보가 틀렸습니다."); //오류를 보냄줌
	}

}
