package com.hmall.team04.dto.product;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ProductBoardDTO {
	private String prd_board_id;
	private int discount_rate;
	private int price;
	private String title;
	private String content;
	private float star;
	private String category;
	private String brand;
	private String prd_board_img;
	
	// like
	private String like_id;
	
	// prd_t 
	private List<ProductDTO> productList;
	
}
