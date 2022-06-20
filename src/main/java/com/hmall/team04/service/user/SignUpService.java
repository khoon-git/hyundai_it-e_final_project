package com.hmall.team04.service.user;

import com.hmall.team04.dto.user.SignUpRequestDTO;

public interface SignUpService {
	
	void signUp(SignUpRequestDTO signUpRequestDTO) throws Exception;

	String checkIdDup(String userId) throws Exception;

	String checkEmailDup(String email)throws Exception;

	void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) throws Exception;

}
