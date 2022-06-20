package com.hmall.team04.dto.rental;

import java.util.Date;

import lombok.Data;

@Data
public class RentalUserDTO {
	  private String prd_id;
	  private String prd_nm;
	  private String upload_path;
	  private String user_id;
	  private Date sdate;
	  private Date edate;
	  private String rental_flag;

}
