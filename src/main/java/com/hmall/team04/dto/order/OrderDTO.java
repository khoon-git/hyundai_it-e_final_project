package com.hmall.team04.dto.order;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDTO {
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
	private String prd_pmt_id;
	private String pay_method;
	private int coupon_discount_amount;
	private int reserve_discount_amount;
	private int balance_discount_amount;
	private List<OrderDetailDTO> orderDetailList;
}
