package com.hmall.team04.service.rental;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmall.team04.dao.rental.RentalProductDAO;
import com.hmall.team04.dto.rental.RentalCriteria;
import com.hmall.team04.dto.rental.RentalProductDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class RentalProductServiceImpl implements RentalProductService{
	
	@Autowired
	private RentalProductDAO rentalProuductDAO;
	
	@Override
	public ArrayList<RentalProductDTO> getAllRentalProductBoardList(RentalCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return rentalProuductDAO.getAllRentalProductBoardList(cri);
	}

	@Override
	public ArrayList<RentalProductDTO> getRentalProductBoardList(RentalCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return rentalProuductDAO.getRentalProductBoardList(cri);
	}

	@Override
	public RentalProductDTO getRentalProduct(String prd_id) throws Exception {
		// TODO Auto-generated method stub
		return rentalProuductDAO.getRentalProduct(prd_id);
	}

	@Override
	public int getAllRentalProductBoardListCount(RentalCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return rentalProuductDAO.getAllRentalProductBoardListCount(cri);
	}

	@Override
	public int getRentalProductBoardListCount(RentalCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return rentalProuductDAO.getRentalProductBoardListCount(cri);
	}
	
}
