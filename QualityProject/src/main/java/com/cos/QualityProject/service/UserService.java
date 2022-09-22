package com.cos.QualityProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.QualityProject.model.QualityCart;
import com.cos.QualityProject.model.QualityUsers;
import com.cos.QualityProject.model.RoleType;
import com.cos.QualityProject.repository.CartRepository;
import com.cos.QualityProject.repository.UserRepository;

import jdk.internal.org.jline.terminal.Size;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private BCryptPasswordEncoder encodeer;
	
	@Transactional
	public void userJoin(QualityUsers user) {
		QualityCart cart = new QualityCart();
		String rawPassword = user.getPassword();
		String endPassword = encodeer.encode(rawPassword);//비밀번호 암호화
		user.setPassword(endPassword);
		user.setRoles(RoleType.USER);
		cart.setUser(user);
		cartRepository.save(cart);
		userRepository.save(user);
		
	}
	
	@Transactional
	public void userUpdate(QualityUsers user) {
		QualityUsers persistance = userRepository.findById(user.getId()).orElseThrow(() ->{
			return new IllegalArgumentException("회원 찾기 실패");
		});
		String rawPassword = user.getPassword();
		String endPassword = encodeer.encode(rawPassword);
		persistance.setPassword(endPassword);
		persistance.setEmail(user.getEmail());
		persistance.setAddress(user.getAddress());
		persistance.setPhone(user.getPhone());
	}
	
	@Transactional
	public void userDelete(int id) {
		userRepository.deleteById(id);
	}
	
	@Transactional
	public void admin() {
		List<QualityUsers> check =  userRepository.findAll();
		if(check.size() == 0) {
			QualityUsers user = new QualityUsers();
			QualityCart cart = new QualityCart();
			user.setName("관리자");
			user.setUsername("admin");
			String rawPassword = "1234";
			String endPassword = encodeer.encode(rawPassword);//비밀번호 암호화
			user.setPassword(endPassword);
			user.setEmail("abc@gmail.com");
			user.setPhone("010-0000-0000");
			user.setAddress("경기도 수원시 그린컴퓨터학원 11층 남자화장실 1사로");
			user.setRoles(RoleType.ADMIN);
			cart.setUser(user);
			cartRepository.save(cart);
			userRepository.save(user);
		}
	}
}
