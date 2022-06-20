package com.hmall.team04.dto.rental;


import java.util.Date;

import lombok.Data;

@Data
public class RentalPrdResponseDTO {
	private String prd_id;
	private String prd_nm;
	private String prd_image; //대여 상품 이미지
	private String category; // 대여상품 카테고리
	private int ticket;
	private Date sdate; //대여 시작일
	private Date edate; //대여 종료일
	private int prd_price;
}

