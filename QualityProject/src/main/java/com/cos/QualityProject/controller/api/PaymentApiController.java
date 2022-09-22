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
import com.cos.QualityProject.model.QualityPayment;
import com.cos.QualityProject.service.PaymentService;

@RestController
public class PaymentApiController {
	
	@Autowired
	private PaymentService paymentService;
	
	@PostMapping("/api/payment")
	public ResponseDto<Integer> save(@RequestBody QualityPayment payment,@AuthenticationPrincipal PrincipalDetail principal) {
		paymentService.toSave(payment,principal);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/payment/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id){
		paymentService.toDelete(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/api/payment/{id}")
	public ResponseDto<Integer> update(@PathVariable int id,@RequestBody QualityPayment payment){
		paymentService.toUpdate(id, payment);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
}
