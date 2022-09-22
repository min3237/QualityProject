package com.cos.QualityProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.QualityProject.model.QualityCartItem;

public interface CartItemRepository extends JpaRepository<QualityCartItem, Integer>{
}
