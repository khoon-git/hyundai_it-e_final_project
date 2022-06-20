package com.hmall.team04.dto.user;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
	private String user_id;
	private String user_nm;
	private String password;
	private String email;
	private Date birth;
	private String address_f;
	private String address_l;
	private String hp_no;
	private Date ins_dt;
	private Date upd_dt;
	private boolean enabled;
	
	private List<AuthDTO> authList;
}
