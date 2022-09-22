package com.cos.QualityProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.QualityProject.model.QualityCart;

public interface CartRepository extends JpaRepository<QualityCart, Integer>{
}
