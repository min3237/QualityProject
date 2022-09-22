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
import com.cos.QualityProject.model.QualityQuery;
import com.cos.QualityProject.service.QueryService;

@RestController
public class QueryApiController {
	
	@Autowired
	private QueryService queryService;
	
	@PostMapping("/api/query")
	public ResponseDto<Integer> save(@RequestBody QualityQuery query,@AuthenticationPrincipal PrincipalDetail principal) {
		queryService.toSave(query,principal);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@DeleteMapping("/api/query/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id){
		queryService.toDelete(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/api/query1/{id}")
	public ResponseDto<Integer> update(@PathVariable int id,@RequestBody QualityQuery query){
		queryService.toUpdate(id, query);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/api/query2/{id}")
	public ResponseDto<Integer> answer(@PathVariable int id,@RequestBody QualityQuery query){
		queryService.toReply(id, query);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
}
