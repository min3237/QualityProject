package com.cos.QualityProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.QualityProject.model.QualityBoards;

public interface BoardRepository extends JpaRepository<QualityBoards,Integer>{
 
}
