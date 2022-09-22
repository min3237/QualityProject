package com.cos.QualityProject.dto;

import java.sql.Timestamp;

import com.cos.QualityProject.model.QualityUsers;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder //빌더 패턴
//@DynamicInsert //insert시에 null인 필드 제외
public class QualityOrderDto {
	private int id;
	
	private String prices;
	
	private String totalPrice;
	
	private String orderTitle;
	
	private QualityUsers user;
	
	private String address;
	
	private String itemIds;
	
	private String itemNames;

	private String quantitys;
	
	private String status;
	
	private String payment;
	
	private Timestamp createDate;
	
}