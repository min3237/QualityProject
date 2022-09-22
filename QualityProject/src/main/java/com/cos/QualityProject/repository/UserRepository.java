package com.cos.QualityProject.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.QualityProject.model.QualityUsers;

public interface UserRepository extends JpaRepository<QualityUsers, Integer>{
	Optional<QualityUsers> findByUsername(String username);
}
