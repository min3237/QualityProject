package com.cos.QualityProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.QualityProject.model.QualityBoards;
import com.cos.QualityProject.repository.BoardRepository;

@Service
public class BoardService {
	@Autowired
	private BoardRepository boardRepository;
	
	@Transactional
	public void toSave(QualityBoards board) {
		boardRepository.save(board);
	}
	
	@Transactional(readOnly = true)
	public Page<QualityBoards> listUp(Pageable pageable){
		return boardRepository.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public List<QualityBoards> listUp(){
		return boardRepository.findAll();
	}
	
	@Transactional(readOnly = true)
	public QualityBoards toDetail(int id) {
		return boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
				});
	}
	
	@Transactional
	public void toDelete(int id) {
		boardRepository.deleteById(id);
	}
	
	@Transactional
	public void toUpdate(int id, QualityBoards requestBoard) {
		QualityBoards board = boardRepository.findById(id).orElseThrow(() ->{
			return new IllegalArgumentException("글 찾기 실패: 아이디를 찾을 수 없습니다.");
		});
		board.setKind(requestBoard.getKind());
		board.setImg(requestBoard.getImg());
		board.setContent(requestBoard.getContent());
		board.setTitle(requestBoard.getTitle());
	}
	
}
