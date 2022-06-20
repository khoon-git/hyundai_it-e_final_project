package com.hmall.team04.dto.cs;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDTO {
	private String article_id;
	private String user_id;
	private String title;
	private String content;
	private char file_yn;
	private Date ins_dt;
	private Date upd_dt;
	private String article_type;
	private String prev_id;
	private String next_id;
	private String prev_title;
	private String next_title;
}
