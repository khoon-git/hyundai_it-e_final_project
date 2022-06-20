package com.hmall.team04.dto.mypage;

import java.util.Date;
import lombok.Data;

@Data
public class MypageDTO {
	private String prd_order_id;
	private String prd_orderdetail_id;
	private String order_flag;
	private String prd_nm;
	private int prd_price;
	private String all_option;
	private Date order_date;
	
}
