package com.cos.QualityProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.QualityProject.model.QualityItems;

public interface ItemsRepository extends JpaRepository<QualityItems,Integer>{
 
}
