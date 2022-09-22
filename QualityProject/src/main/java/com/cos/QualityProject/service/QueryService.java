package com.cos.QualityProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.QualityProject.config.auth.PrincipalDetail;
import com.cos.QualityProject.model.QualityQuery;
import com.cos.QualityProject.repository.QueryRepository;

@Service
public class QueryService {
	@Autowired
	private QueryRepository QueryRepository;
	
	@Transactional
	public void toSave(QualityQuery query,PrincipalDetail principal) {
		query.setUser(principal.getUser());
		QueryRepository.save(query);
	}
	
	@Transactional(readOnly = true)
	public Page<QualityQuery> listUp(Pageable pageable){
		return QueryRepository.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public List<QualityQuery> listUp(){
		return QueryRepository.findAll();
	}
	
	@Transactional(readOnly = true)
	public QualityQuery toDetail(int id) {
		return QueryRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
				});
	}
	
	@Transactional
	public void toDelete(int id) {
		QueryRepository.deleteById(id);
	}
	
	@Transactional
	public void toUpdate(int id, QualityQuery requestBoard) {
		QualityQuery Query = QueryRepository.findById(id).orElseThrow(() ->{
			return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
		});
		Query.setContent(requestBoard.getContent());
		Query.setTitle(requestBoard.getTitle());
	}
	
	@Transactional
	public void toReply(int id, QualityQuery requestBoard) {
		QualityQuery Query = QueryRepository.findById(id).orElseThrow(() ->{
			return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
		});
		Query.setAnswer(requestBoard.getAnswer());
		Query.setAnswerC(1);
	}
}
