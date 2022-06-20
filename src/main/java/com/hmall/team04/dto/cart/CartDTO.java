package com.hmall.team04.dto.cart;

import lombok.Data;

@Data
public class CartDTO {
	private String prd_cart_id;
	private String user_id;
	private String prd_id;
	private int cart_amount;
	
	// prd_t
	private String prd_nm;
	private int amount;
	private int prd_price;
	private String prd_board_id;
	private String prd_image;
	private String option1;
	private String option2;
	
	// file_t
	private String upload_path;
}
