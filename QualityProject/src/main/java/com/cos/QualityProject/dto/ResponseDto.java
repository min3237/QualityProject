package com.cos.QualityProject.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor//빈 생성자 
@AllArgsConstructor//찬 생성자
@Builder
public class ResponseDto<T> {
	//ResponseDto();
	//ResponseDto(int stauts, T data);
	int stauts;
	T data;
}
