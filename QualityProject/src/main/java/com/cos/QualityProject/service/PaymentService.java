package com.cos.QualityProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.QualityProject.config.auth.PrincipalDetail;
import com.cos.QualityProject.model.QualityPayment;
import com.cos.QualityProject.repository.PaymentRepository;

@Service
public class PaymentService {
	@Autowired
	private PaymentRepository paymentRepository;
	
	@Transactional
	public void toSave(QualityPayment payment,PrincipalDetail principal) {
		payment.setUser(principal.getUser());
		paymentRepository.save(payment);
	}
	
	@Transactional(readOnly = true)
	public Page<QualityPayment> listUp(Pageable pageable){
		return paymentRepository.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public List<QualityPayment> listUp(){
		return paymentRepository.findAll();
	}
	
	@Transactional(readOnly = true)
	public QualityPayment toDetail(int id) {
		return paymentRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
				});
	}
	
	@Transactional
	public void toDelete(int id) {
		paymentRepository.deleteById(id);
	}
	
	@Transactional
	public void toUpdate(int id, QualityPayment requestPayment) {
		QualityPayment payment = paymentRepository.findById(id).orElseThrow(() ->{
			return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
		});
		payment.setBank(requestPayment.getBank());
		payment.setCardNum(requestPayment.getCardNum());
		payment.setName(requestPayment.getName());
	}
	
}
