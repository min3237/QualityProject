package com.cos.QualityProject.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@SequenceGenerator(
		name = "QUALITYUSER_SEQ_GENERATOR1"
	    , sequenceName = "QUALITY_SEQ1"
	    , initialValue = 1
	    , allocationSize = 1
	)
@Table(name="qualityUsers")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class QualityUsers {
	@Id //primary key
	
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="QUALITYUSER_SEQ_GENERATOR1")
	//프로젝트에 연결된 DB의 넘버링 전략을 사용
	private int id;//시퀀스
	
	@Column(nullable=false, length=30,unique = true)
	private String username;//아이디
	
	@Column(nullable=false, length=30)
	private String name;

	@Column(nullable=false, length=100)//해쉬로 변경하여 암호화 length 크게
	private String password; 
	
	@Column(nullable=false, length=50)
	private String email;
	
	@Column(nullable=false, length=50)
	private String address;
	
	@Column(nullable=false, length=50,unique = true)
	private String phone;
	
	@OneToMany(mappedBy="user") 
	private List<QualityPayment> payment;
	
	//@ColumnDefault("'user'")
	@Enumerated(EnumType.STRING)
	private RoleType roles; //Enum을 쓰는게 좋다. //도메인 사용해야해서. 
	//예) admin, user, manager (권한) 셋 중 하나만 

}
