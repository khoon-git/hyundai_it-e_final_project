package com.hmall.team04.dto.cs;

import java.util.Date;

import lombok.Data;

@Data
public class FaqDTO {
	private String article_id;
	private String title;
	private String content;
	private String file_yn;
	private Date ins_dt;
	private Date upd_dt;
	private String faq_flag;
}
 