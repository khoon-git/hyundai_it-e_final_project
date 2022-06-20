package com.hmall.team04.dto.cs;

import java.util.Date;

import lombok.Data;

@Data
public class QnaDTO {
	private String user_id;
	private String ans_user_id;
	private String title;
	private String content;
	private String type;
	private String ans_title;
	private String ans_content;
	private Date ins_dt;
	private Date ans_ins_dt;
	private char private_yn;
	private char ans_yn;
	private char file_yn;
	private String prd_id;
	private String prd_orderdetail_id;
}
