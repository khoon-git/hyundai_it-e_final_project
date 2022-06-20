package com.hmall.team04.dto.file;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hmall.team04.dto.user.AuthDTO;

import lombok.Data;

@Data
public class FileDTO {
	// file_t
	private String file_id;
	private String article_id;
	private String upload_path;
	private String file_nm;
	private String file_type;
	private Date ins_dt;
	private String board_flag;
	private String user_id;
	private String prd_board_id;
	
	private MultipartFile uploadfile;
}
