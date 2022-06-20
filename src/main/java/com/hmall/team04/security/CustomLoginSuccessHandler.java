package com.hmall.team04.security;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hmall.team04.dto.common.ResponseDataCode;
import com.hmall.team04.dto.common.ResponseDataDTO;
import com.hmall.team04.dto.common.ResponseDataStatus;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	 
	 @Override
	 public void onAuthenticationSuccess(HttpServletRequest request,
				HttpServletResponse response, Authentication authentication)
				throws IOException, ServletException {
		 	ObjectMapper mapper = new ObjectMapper();	//JSON 변경용
	    	
	    	ResponseDataDTO responseDataDTO = new ResponseDataDTO();
	    	responseDataDTO.setCode(ResponseDataCode.SUCCESS);
	    	responseDataDTO.setStatus(ResponseDataStatus.SUCCESS);
	    	
	    	String prevPage = request.getSession().getAttribute("prevPage").toString();	//이전 페이지 가져오기
	    	 
	    	Map<String, String> items = new HashMap<String,String>();	
	    	items.put("url", prevPage);	// 이전 페이지 저장
	    	responseDataDTO.setItem(items);
	    	
	    	response.setCharacterEncoding("UTF-8");
	        response.setStatus(HttpServletResponse.SC_OK);
	        response.getWriter().print(mapper.writeValueAsString(responseDataDTO));
	        response.getWriter().flush();
			
		}
}