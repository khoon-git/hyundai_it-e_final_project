package com.hmall.team04.dto.user;

import java.util.Date;

import lombok.Data;

@Data
public class UserTDTO {
	private String user_id;
	private String user_nm;
	private String password;
	private String email;
	private Date birth;
	private String address_f;
	private String address_l;
	private String hp_no;
	private String gender;
	private Date upd_dt;
	//private boolean enabled;
}
