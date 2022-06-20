package com.hmall.team04.dao.user;

import org.apache.ibatis.annotations.Param;

import com.hmall.team04.dto.user.LeaveUserDTO;
import com.hmall.team04.dto.user.UserDTO;
import com.hmall.team04.dto.user.UserTDTO;

public interface UserDAO {
	public UserDTO selectUserInfo(String userid);

	public UserDTO findIdbyNameEmail(@Param("usernm") String usernm, @Param("email") String email) throws Exception;

	public int findPwd(@Param("user_id") String id, @Param("email") String email, @Param("hp_no") String pno) throws Exception;
	
	public String getUserNamebyUserId(String userid) throws Exception;

	public String comparePassword(@Param("user_id") String user_id) throws Exception;

	public int updatePassword(@Param("user_id") String user_id, @Param("new_pw") String new_pw);

	public UserTDTO getUserInfo(String userid) throws Exception;

	public void updateUserInfo(@Param("userid") String name, @Param("dto") UserTDTO userTDTO, @Param("updtRows") Integer updtRows) throws Exception;

	public void insertLeaveUser(LeaveUserDTO leaveUserDTO) throws Exception;
}
