package com.hmall.team04.dao.user;

import com.hmall.team04.dto.user.SignUpRequestDTO;

public interface SignUpDAO {
	public String checkUserIdYn(String userId);
	public String checkUserEmailYn(String email);
	public SignUpRequestDTO insertUser(SignUpRequestDTO signUpRequestDTO) throws Exception;
}
