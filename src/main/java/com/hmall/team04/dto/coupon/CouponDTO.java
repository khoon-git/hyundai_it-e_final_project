package com.hmall.team04.dto.coupon;

import java.util.Date;

import lombok.Data;

@Data
public class CouponDTO {
	private String user_id;
	private String coupon_id;
	private String coupon_nm;
	private Integer coupon_price;
	private Date coupon_valid_dt;
	private Integer coupon_min_price;
	private char coupon_active;
	
}