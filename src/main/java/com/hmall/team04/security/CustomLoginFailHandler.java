package com.hmall.team04.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hmall.team04.dto.common.ResponseDataCode;
import com.hmall.team04.dto.common.ResponseDataDTO;
import com.hmall.team04.dto.common.ResponseDataStatus;

public class CustomLoginFailHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		ObjectMapper mapper = new ObjectMapper();	//JSON 변경용
    	
    	ResponseDataDTO responseDataDTO = new ResponseDataDTO();
    	if (exception instanceof AuthenticationServiceException) {
    		responseDataDTO.setCode(ResponseDataCode.ERROR);
        	responseDataDTO.setStatus(ResponseDataStatus.ERROR);
        	responseDataDTO.setMessage("존재하지 않는 사용자입니다.");
		
		} else if(exception instanceof BadCredentialsException) {
			responseDataDTO.setCode(ResponseDataCode.ERROR);
	    	responseDataDTO.setStatus(ResponseDataStatus.ERROR);
	    	responseDataDTO.setMessage("아이디 또는 비밀번호가 틀립니다.");
			
		} else if(exception instanceof LockedException) {
			responseDataDTO.setCode(ResponseDataCode.ERROR);
	    	responseDataDTO.setStatus(ResponseDataStatus.ERROR);
	    	responseDataDTO.setMessage("잠긴 계정입니다.");
			
		} else if(exception instanceof DisabledException) {
			responseDataDTO.setCode(ResponseDataCode.ERROR);
	    	responseDataDTO.setStatus(ResponseDataStatus.ERROR);
	    	responseDataDTO.setMessage("비활성화된 계정입니다.");
			
		} else if(exception instanceof AccountExpiredException) {
			responseDataDTO.setCode(ResponseDataCode.ERROR);
	    	responseDataDTO.setStatus(ResponseDataStatus.ERROR);
	    	responseDataDTO.setMessage("만료된 계정입니다.");
			
		} else if(exception instanceof CredentialsExpiredException) {
			responseDataDTO.setCode(ResponseDataCode.ERROR);
	    	responseDataDTO.setStatus(ResponseDataStatus.ERROR);
	    	responseDataDTO.setMessage("비밀번호가 만료되었습니다.");
		}
    	

    	
    	response.setCharacterEncoding("UTF-8");
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().print(mapper.writeValueAsString(responseDataDTO));
        response.getWriter().flush();
	}
	

}
