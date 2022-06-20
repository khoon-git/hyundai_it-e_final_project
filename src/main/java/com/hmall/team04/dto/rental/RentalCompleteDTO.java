package com.hmall.team04.dto.rental;

import java.util.Date;

import lombok.Data;

@Data
public class RentalCompleteDTO {
	
	
	//  rental_prd_order_t       대여 주문서 테이블
	private String prd_order_id; //merchant_uid
	private String user_id;
	private String recipient;
	private int pmt_amount;
	private String address_dest;
	private String tel_no;
	private String hp_no;
	private String order_comment;
	private Date order_date;
//	private String prd_pmt_id;
	private String prd_id; //대여상품 id
	private String order_flag; // 초기값 : STEP5
//	private Date cancel_date;
	private int ticket;
			


	// rental_user_dt_t       
	// private String prd_id;
	//	private String user_id;
	private Date sdate;
	private Date edate;
	private String rental_flag; //초기값 : STEP2
	
	// rental_prd_t
//	private String prd_id; //대여상품 id
	private String prd_nm; //상품이름
	private String prd_image; //상품이미지
	private String category; //카테고리
	private int rental_yn; //렌탈 가능 여부
	
	// prd_payment_t
//	private String prd_pmt_id;    //결제정보 id (시퀀스)
//	private String prd_order_id;
	private Date pmt_time;    //결제시간
//	private int pmt_amount;
	private String pmt_id;    // 결제고유번호
	private String user_nm;
	private String vbank_holder;
	private String vbank_name;
	private String vbank_num;
	private Date vbank_date;
	private String pay_status;
	private String pay_method;
	
	private int coupon_discount_amount;
	private int reserve_discount_amount;
	private int balance_discount_amount;
	
	private String coupon_id;
	
}
