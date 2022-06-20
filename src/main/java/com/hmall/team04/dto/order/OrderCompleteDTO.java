package com.hmall.team04.dto.order;

import java.util.Date;

import lombok.Data;

@Data
public class OrderCompleteDTO {
	// prd_order_t
	private String prd_order_id;
	private String user_id;
	private String recipient;
	private int total_amount;
	private int discount_amount;
	private int pmt_amount;
	private String address_dest;
	private String tel_no;
	private String hp_no;
	private String order_comment;
	private Date order_date;
	//private String prd_pmt_id;
	private int coupon_discount_amount;
	private int reserve_discount_amount;
	private int balance_discount_amount;
	
	// prd_orderdetail_t
	//private String prd_orderdetail_id;
	//private String prd_order_id;
	private String prd_id;
	private int prd_count;
	private String order_flag;
	private Date cancel_date;
	private String prd_board_id;
	private String cancel_reason;
	
	// prd_payment_t
	//private String prd_pmt_id;
	//private String prd_order_id;
	private Date pmt_time;
	//private int pmt_amount;
	private String pmt_id;
	private String user_nm;
	private String vbank_holder;
	private String vbank_name;
	private String vbank_num;
	private Date vbank_date;
	private String pay_status;
	private String pay_method;
	
	private String coupon_id;
	private int expectPoint;
}
