package com.hmall.team04.dto.rental;

import lombok.Data;

@Data
public class RentalProductDTO {
	private String prd_id;
	private String prd_nm;
	private String prd_image;
	private String category;
	private boolean rental_yn;
	private int prd_price_7;
	private int prd_price_14;
	private String prd_brand;
}
