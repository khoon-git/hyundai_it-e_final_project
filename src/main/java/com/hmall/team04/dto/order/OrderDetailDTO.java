package com.hmall.team04.dto.order;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDetailDTO {
	private String prd_order_id;
	private String prd_orderdetail_id;
	private String prd_nm;
	private String prd_price;
	private String order_flag;
	private String upload_path;
	private String all_option;
	private String prd_count;
	private Date cancel_date;
	private String prd_board_id;
	private String prd_id;
	private String cancel_reason;

}

