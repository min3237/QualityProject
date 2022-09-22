package com.cos.QualityProject.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.QualityProject.dto.ResponseDto;
import com.cos.QualityProject.model.QualityItems;
import com.cos.QualityProject.service.ItemsService;

@RestController
public class ItemsApiController {
	
	@Autowired
	private ItemsService itemsService;
	
	@PostMapping("/api/item")
	public ResponseDto<Integer> save(@RequestBody QualityItems items) {
		itemsService.toSave(items);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/item/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id){
		itemsService.toDelete(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/api/item/{id}")
	public ResponseDto<Integer> update(@PathVariable int id,@RequestBody QualityItems items){
		itemsService.toUpdate(id, items);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
}
