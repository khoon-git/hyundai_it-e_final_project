package com.hmall.team04.service.balance;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.balance.BalanceDAO;



import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BalanceServiceImpl implements BalanceService {
	
	private BalanceDAO balanceDAO;
	
	public BalanceServiceImpl(BalanceDAO balanceDAO) {
		this.balanceDAO = balanceDAO;
	}
	
	@Override
	public int getBalancebyUserId(String userid) throws Exception {
		
		return balanceDAO.getBalancebyUserId(userid);
	}

}
