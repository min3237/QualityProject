package com.cos.QualityProject.model;

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
		name = "QUALITYUSER_SEQ_GENERATOR3"
	    , sequenceName = "QUALITY_SEQ3"
	    , initialValue = 1
	    , allocationSize = 1
	)
@Table(name="qualityCartItem")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class QualityCartItem {
	
	@Id //primary key
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="QUALITYUSER_SEQ_GENERATOR3")
	private int id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="cartId")
	private QualityCart cart; //mappedBy 

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="itemId")
	private QualityItems item;

}
