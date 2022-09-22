package com.cos.QualityProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.QualityProject.model.QualityItems;
import com.cos.QualityProject.repository.ItemsRepository;

@Service
public class ItemsService {
	@Autowired
	private ItemsRepository itemsRepository;
	
	@Transactional
	public void toSave(QualityItems items) {
		itemsRepository.save(items);
	}
	
	@Transactional(readOnly = true)
	public Page<QualityItems> listUp(Pageable pageable){
		return itemsRepository.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public List<QualityItems> listUp(){
		return itemsRepository.findAll();
	}
	
	@Transactional(readOnly = true)
	public QualityItems toDetail(int id) {
		return itemsRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
				});
	}
	
	@Transactional
	public void toDelete(int id) {
		itemsRepository.deleteById(id);
	}
	
	@Transactional
	public void toUpdate(int id, QualityItems requestBoard) {
		QualityItems items = itemsRepository.findById(id).orElseThrow(() ->{
			return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
		});
		items.setName(requestBoard.getName());
		items.setAccount(requestBoard.getAccount());
		items.setKind(requestBoard.getKind());
		items.setPrice(requestBoard.getPrice());
		items.setImg(requestBoard.getImg());
	}
	
}
