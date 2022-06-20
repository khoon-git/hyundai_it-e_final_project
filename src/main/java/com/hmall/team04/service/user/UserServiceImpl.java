package com.hmall.team04.service.user;


import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hmall.team04.dao.user.UserDAO;
import com.hmall.team04.dto.user.LeaveUserDTO;
import com.hmall.team04.dto.user.UserDTO;
import com.hmall.team04.dto.user.UserTDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService {
	private static final Exception PasswordNotEqualException = null;
	private UserDAO userDAO;
	private final PasswordEncoder passwordEncoder;
	
	public UserServiceImpl(UserDAO userDAO, PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
		this.userDAO = userDAO;
	}
	
	@Override
	public UserDTO findIdbyNameEmail(String usernm, String email) throws Exception {
		// TODO Auto-generated method stub
		UserDTO userDTO = userDAO.findIdbyNameEmail(usernm, email);
		if(userDTO == null) {
			log.info("id 혹은 이메일이 존재하지 않습니다");
			throw new Exception("id 혹은 이메일이 존재하지 않습니다");
		}
		return userDTO;
	}

	@Override
	public int findPwd(String id, String email, String pno) throws Exception {
		// TODO Auto-generated method stub
		log.info("--------------test-------------" + email);
		return userDAO.findPwd(id, email, pno);
	}

	@Override
	public String getUserNamebyUserId(String userid) throws Exception {
			return userDAO.getUserNamebyUserId(userid);
	}

	@Override
	public void comparePassword(String user_id, String old_pw) throws Exception {
		if (passwordEncoder.matches(old_pw, userDAO.comparePassword(user_id)) == false)
			throw PasswordNotEqualException;
	}

	@Override
	@Transactional
	public void updatePassword(String user_id, String old_pw, String new_pw) throws Exception {
		comparePassword(user_id, old_pw);
		if (userDAO.updatePassword(user_id, passwordEncoder.encode(new_pw)) != 1) {
			throw new Exception();
		}
	}

	@Override
	public UserTDTO getUserInfo(String name) throws Exception {
		return userDAO.getUserInfo(name);
	}

	@Override
	@Transactional
	public void updateUserInfo(String name, UserTDTO userTDTO) throws Exception {
		Integer updtRows = 0;
		userDAO.updateUserInfo(name, userTDTO, updtRows);
//		if (updtRows != 1)
//			throw new Exception();
	}

	@Override
	@Transactional
	public void insertLeaveUser(LeaveUserDTO leaveUserDTO) throws Exception {
		userDAO.insertLeaveUser(leaveUserDTO);
	}

}
