package com.cos.QualityProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.QualityProject.config.auth.PrincipalDetail;
import com.cos.QualityProject.model.QualityCartItem;
import com.cos.QualityProject.repository.CartItemRepository;

@Service
public class CartItemService {
	@Autowired
	private CartItemRepository cartItemRepository;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ItemsService itemsService;
	
	@Transactional
	public void toSave(int id,PrincipalDetail principal) {
		QualityCartItem cartItem = new QualityCartItem();
		cartItem.setItem(itemsService.toDetail(id));
		cartItem.setCart(cartService.toDetail(principal.getUser().getId()));
		
		cartItemRepository.save(cartItem);
	}
	
	@Transactional(readOnly = true)
	public Page<QualityCartItem> listUp(Pageable pageable){
		return cartItemRepository.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public List<QualityCartItem> listUp(){
		return cartItemRepository.findAll();
	}
	
	@Transactional(readOnly = true)
	public QualityCartItem toDetail(int id) {
		return cartItemRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
				});
	}
	
	@Transactional
	public void toDelete(int id) {
		cartItemRepository.deleteById(id);
	}
	
}
