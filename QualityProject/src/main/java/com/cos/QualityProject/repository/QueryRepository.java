package com.cos.QualityProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.QualityProject.model.QualityQuery;

public interface QueryRepository extends JpaRepository<QualityQuery,Integer>{
 
}
