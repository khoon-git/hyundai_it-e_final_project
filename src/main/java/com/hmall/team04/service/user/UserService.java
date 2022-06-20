package com.hmall.team04.service.user;

import com.hmall.team04.dto.user.LeaveUserDTO;
import com.hmall.team04.dto.user.UserDTO;
import com.hmall.team04.dto.user.UserTDTO;

public interface UserService {
	UserDTO findIdbyNameEmail(String usernm, String email) throws Exception;

	int findPwd(String id, String email, String pno) throws Exception;

	String getUserNamebyUserId(String userid) throws Exception;

	void comparePassword(String user_id, String old_pw) throws Exception;

	void updatePassword(String user_id, String old_pw, String new_pw) throws Exception;

	UserTDTO getUserInfo(String name) throws Exception;

	void updateUserInfo(String name, UserTDTO userTDTO) throws Exception;

	void insertLeaveUser(LeaveUserDTO leaveUserDTO) throws Exception;
}
