package com.hmall.team04.dto.order;

import lombok.Data;

@Data

public class OrderPrdResponseDTO {
	private String prd_id;
	private String prd_nm;
	private String option1;
	private String option2;
	private int prd_price;
	private String prd_board_id;
	private String prd_image; //상품 이미지
	
	private int prd_count; //상품 주문 개수
}
