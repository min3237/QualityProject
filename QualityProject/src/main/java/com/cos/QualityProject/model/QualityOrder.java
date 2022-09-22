package com.cos.QualityProject.model;

import java.sql.Timestamp;

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

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@SequenceGenerator(
		name = "QUALITYUSER_SEQ_GENERATOR6"
	    , sequenceName = "QUALITY_SEQ6"
	    , initialValue = 1
	    , allocationSize = 1
	)
@Table(name="qualityOrder")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity 
public class QualityOrder {
	@Id //primary key
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="QUALITYUSER_SEQ_GENERATOR6")
	private int id;
	
	@Column(nullable=false, length=100)
	private String Prices;
	
	@Column(nullable=false, length=50)
	private String totalPrice;
	
	@Column(nullable=false, length=50)
	private String orderTitle;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="userId")
	private QualityUsers user;
	
	@Column(nullable=false, length=50)
	private String address;
	
	@Column(nullable=false, length=300)
	private String itemIds;
	
	@Column(nullable=false, length=300)
	private String itemNames;
	
	@Column(nullable=false, length=100)
	private String quantitys;
	
	@Column(nullable=false, length=20)
	private String status;
	
	@Column(nullable=false, length=100)
	private String payment;
	
	@CreationTimestamp 
	private Timestamp createDate;

}