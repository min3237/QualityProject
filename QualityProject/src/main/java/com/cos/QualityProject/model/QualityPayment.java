package com.cos.QualityProject.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@SequenceGenerator(
		name = "QUALITYUSER_SEQ_GENERATOR4"
	    , sequenceName = "QUALITY_SEQ4"
	    , initialValue = 1
	    , allocationSize = 1
	)
@Table(name="qualityPayment")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder 
@Entity
public class QualityPayment {
	@Id //primary key
	
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="QUALITYUSER_SEQ_GENERATOR4")
	//프로젝트에 연결된 DB의 넘버링 전략을 사용
	private int id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="userId")
	private QualityUsers user;
	
	@Column(nullable=false, length=30)
	private String name;
	
	@Column(nullable=false, length=30)
	private String bank;
	
	@Column(nullable=false, length=30, unique = true)
	private String cardNum;
	
	
}
