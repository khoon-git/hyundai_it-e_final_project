package com.hmall.team04.dto.rental;

import java.util.Date;

import lombok.Data;

@Data
public class RentalOrderDTO {
	private String prd_id;
	private String prd_nm;
	private String prd_image;
	private String rental_yn;
	private Date sdate;
	private Date edate;
	private String rental_flag;
}
