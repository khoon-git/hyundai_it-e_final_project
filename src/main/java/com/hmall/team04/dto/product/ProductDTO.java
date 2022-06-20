package com.hmall.team04.dto.product;

import lombok.Data;

@Data
public class ProductDTO {
	private String prd_id;
	private String prd_nm;
	private int prd_price;
	private int amount;
	
	private String prd_board_id;
	private String prd_image;
	
	private String option1;
	private String option2;
}
