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

@Table(name="qualityBoards")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder //빌더 패턴
@SequenceGenerator(
		name = "QUALITYUSER_SEQ_GENERATOR5"
	    , sequenceName = "QUALITY_SEQ5"
	    , initialValue = 1
	    , allocationSize = 1
	)
@Entity
public class QualityBoards {
	@Id //기본키
	
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="QUALITYUSER_SEQ_GENERATOR5")
	private int id;
	
	@Column(nullable=false, length=100)
	private String title;
	
	@Lob
	//대용량 데이터
	private String content;
	
	@Column(nullable=false, length=5)
	private int kind;
	
	@Column(nullable=false, length=100)
	private String img;
}
