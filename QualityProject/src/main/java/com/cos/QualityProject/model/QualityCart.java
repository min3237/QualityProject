package com.cos.QualityProject.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@SequenceGenerator(
		name = "QUALITYUSER_SEQ_GENERATOR8"
	    , sequenceName = "QUALITY_SEQ8"
	    , initialValue = 1
	    , allocationSize = 1
	)
@Table(name="qualityCart")
@Data
@NoArgsConstructor
@AllArgsConstructor  
@Builder
@Entity
public class QualityCart {
	@Id //primary key
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="QUALITYUSER_SEQ_GENERATOR8")
	private int id;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="userId")
	private QualityUsers user;
	
	@OneToMany(mappedBy="cart", fetch = FetchType.EAGER) //QualityCartItem
	private List<QualityCartItem> cartItems;
}
