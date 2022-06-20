package com.hmall.team04.dao.balance;

public interface BalanceDAO {

	/* 마이페이지 예치금 */
	int getBalancebyUserId(String userid) throws Exception;
}
