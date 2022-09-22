package com.cos.QualityProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.QualityProject.model.QualityCart;
import com.cos.QualityProject.repository.CartRepository;

@Service
public class CartService {
	
	@Autowired
	private CartRepository cartRepository;
	
	@Transactional(readOnly = true)
	public QualityCart toDetail(int id) {
		return cartRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
				});
	}
	
	@Transactional
	public void toDelete(int id) {
		cartRepository.deleteById(id);
	}
	
}
