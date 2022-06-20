package com.hmall.team04.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

import com.hmall.team04.dao.user.UserDAO;
import com.hmall.team04.dto.user.CustomUser;
import com.hmall.team04.dto.user.UserDTO;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Setter(onMethod_ = {@Autowired})
	private UserDAO userDAO;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		log.warn("Load User By UserName : "+ userName);
		
		UserDTO vo = userDAO.selectUserInfo(userName); //userName은 user_id를 의미
		
		log.warn("queried by member mapper: " + vo);
		
		//CustomUser 반환
		return vo == null? null : new CustomUser(vo);
	}

}

