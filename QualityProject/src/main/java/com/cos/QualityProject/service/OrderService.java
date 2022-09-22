package com.cos.QualityProject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.QualityProject.dto.QualityOrderDto;
import com.cos.QualityProject.model.QualityOrder;
import com.cos.QualityProject.repository.OrderRepository;

@Service
public class OrderService {
	@Autowired
	private OrderRepository orderRepository;
	
	@Transactional
	public void toSave(QualityOrder order) {
		orderRepository.save(order);
	}
	
	@Transactional(readOnly = true)
	public Page<QualityOrder> listUp(Pageable pageable){
		return orderRepository.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public List<QualityOrder> listUp(){
		return orderRepository.findAll();
	}
	
	@Transactional(readOnly = true)
	public QualityOrder toDetail(int id) {
		return orderRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
				});
	}
	
	@Transactional(readOnly = true)
	public List<QualityOrderDto> listUp(int id){
		QualityOrder order = toDetail(id);
		ArrayList<QualityOrderDto> orderdtos = new ArrayList<>();
		String itemIds[] = order.getItemIds().split(","); 
		String prices[] = order.getPrices().split(",");
		String itemNames[] = order.getItemNames().split(",");
		String quantitys[] = order.getQuantitys().split(",");
		for(int i =0;i < itemIds.length;i++) { 
			QualityOrderDto OrderDto = new QualityOrderDto();
			OrderDto.setAddress(order.getAddress());
			OrderDto.setId(order.getId());
			OrderDto.setTotalPrice(order.getTotalPrice());
			OrderDto.setUser(order.getUser());
			OrderDto.setOrderTitle(order.getOrderTitle());
			OrderDto.setCreateDate(order.getCreateDate());
			OrderDto.setPrices(prices[i]);
			OrderDto.setItemIds(itemIds[i]);
			OrderDto.setItemNames(itemNames[i]);
			OrderDto.setQuantitys(quantitys[i]);
			OrderDto.setStatus(order.getStatus());
			OrderDto.setPayment(order.getPayment());
			orderdtos.add(OrderDto);
		}
		return orderdtos;
	}
	
	@Transactional
	public void toDelete(int id) {
		orderRepository.deleteById(id);
	}
	
	@Transactional
	public void toUpdate(int id, QualityOrder requestBoard) {
		QualityOrder order = orderRepository.findById(id).orElseThrow(() ->{
			return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
		});
		order.setStatus(requestBoard.getStatus());
	}
}
