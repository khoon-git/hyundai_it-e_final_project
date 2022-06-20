package com.hmall.team04.dto.user;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class SignUpRequestDTO {
	
	
	//@NotEmpty(message="아이디를 입력해주세요.")
	@Pattern(regexp="^[a-zA-Z0-9]{4,20}$", message="아이디는 숫자와 영문자를 포함해 4~20자리를 사용해야 합니다.")
	private String user_id;
	
	//@NotEmpty(message="이메일을 입력해주세요.")
	@Email(message="이메일 형식에 맞춰 올바르게 입력해주세요.")
	private String email;
	
	@Pattern(regexp="^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\\\(\\\\)\\-_=+]).{8,30}$", message="영문,숫자,특수문자를 포함해 8~30자리를 사용해야 합니다.")
	private String password;
	
	@Pattern(regexp="^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\\\(\\\\)\\-_=+]).{8,30}$", message="영문,숫자,특수문자를 포함해 8~30자리를 사용해야 합니다.")
	private String check_password;
	
	//@NotEmpty(message="이름를 입력해주세요.")
	@Pattern(regexp="^[ㄱ-ㅎ가-힣]{2,8}$", message="이름은 2~8자 한글로 입력해주세요.")
	private String user_nm;
	
	@NotEmpty(message = "성별을 선택해주세요.")
	private String gender;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	
	@NotEmpty(message = "우편번호를 입력해주세요.")
	private String address_f;
	
	@NotEmpty(message = "주소를 입력해주세요.")
	private String address_l;
	
	//@NotEmpty(message="휴대폰 번호를 입력해주세요.")
	@Pattern(regexp = "^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$", message = "휴대폰 번호를 올바르게 입력해 주세요.")
	private String hp_no;
	
	private String auth;
	
	public boolean isPwEqualToCheckPw() {
        return password.equals(check_password);
    }
}
