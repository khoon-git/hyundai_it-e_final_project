package com.hmall.team04.dto.review;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hmall.team04.dto.file.FileDTO;

import lombok.Data;

@Data
public class ReviewDTO {
	// review_t
	private String review_id;
	private String prd_board_id;
	private String prd_id;
	private String user_id;
	private String content;
	private int star;
	private Date ins_dt;
	private int file_yn;
	
	// prd_t
	private String option1;
	private String option2;
	
	// files
	private List<FileDTO> fileList;
	private MultipartFile[] uploadfiles;
}
