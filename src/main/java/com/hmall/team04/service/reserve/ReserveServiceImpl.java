package com.hmall.team04.service.reserve;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.reserve.ReserveDAO;
import com.hmall.team04.service.cs.FaqServiceImpl;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReserveServiceImpl implements ReserveService {
 
	private ReserveDAO reserveDAO;
	
	public ReserveServiceImpl(ReserveDAO reserveDAO) {
		this.reserveDAO = reserveDAO;
	}
	
	@Override
	public int getReservebyUserId(String userid) throws Exception {
		
		return reserveDAO.getReservebyUserId(userid);
	}

}
