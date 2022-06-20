package com.hmall.team04.dao.reserve;

public interface ReserveDAO {
	/* 마이페이지 적립금 */
	int getReservebyUserId(String userid) throws Exception;
}
