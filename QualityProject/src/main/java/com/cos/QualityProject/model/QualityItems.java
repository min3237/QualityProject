package com.cos.QualityProject.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@SequenceGenerator(
		name = "QUALITYUSER_SEQ_GENERATOR2"
	    , sequenceName = "QUALITY_SEQ2"
	    , initialValue = 1
	    , allocationSize = 1
	)
@Table(name="qualityItems")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class QualityItems {
	@Id //primary key
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="QUALITYUSER_SEQ_GENERATOR2")
	private int id;//시퀀스
	
	@Column(nullable=false, length=100)
	private String img;
	
	@Column(nullable=false, length=30)
	private int price;
	
	@Column(nullable=false, length=30)
	private String name;
	
	@Lob
	private String account;
	
	@Column(nullable=false, length=5)
	private int kind;
}
