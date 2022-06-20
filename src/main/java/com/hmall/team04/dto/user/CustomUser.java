package com.hmall.team04.dto.user;

import java.util.Collection;

import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Data;
import lombok.Getter;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class CustomUser extends User{
	private static final long serialVersionUID = 1L;
	private UserDTO user;
	
	public CustomUser(String username, String password, boolean enabled,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, true, true, true, authorities);
		// TODO Auto-generated constructor stub
	}
	
	public CustomUser(UserDTO vo) {
		super(vo.getUser_id(), vo.getPassword(), vo.isEnabled(), true, true, true, vo.getAuthList()
													.stream()
													.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.user = vo;
	}

}
