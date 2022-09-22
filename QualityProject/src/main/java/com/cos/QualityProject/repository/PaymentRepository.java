package com.cos.QualityProject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.QualityProject.model.QualityPayment;

public interface PaymentRepository extends JpaRepository<QualityPayment,Integer>{
 
}
