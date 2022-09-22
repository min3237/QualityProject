package com.cos.QualityProject.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="qualityQuery")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@SequenceGenerator(
		name = "QUALITYUSER_SEQ_GENERATOR7"
	    , sequenceName = "QUALITY_SEQ7"
	    , initialValue = 1
	    , allocationSize = 1
	)
@Entity
public class QualityQuery {
	@Id //기본키
	
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="USER_SEQ_GENERATOR7")
	private int id;
	
	@Column(nullable=false, length=100)
	private String title;
	
	@Lob
	private String content;
	
	@Lob
	private String answer;
	
	@Column(nullable=false, length=5)
	@ColumnDefault("0")  //안해주면 null이 들어감**
	private int answerC;
	
	@CreationTimestamp 
	private Timestamp createDate;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="userId")
	private QualityUsers user;
}
