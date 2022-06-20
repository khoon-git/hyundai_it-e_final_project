package com.hmall.team04.service.main;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmall.team04.dao.main.MainDAO;
import com.hmall.team04.dto.product.ProductDTO;
import com.hmall.team04.dto.rental.RentalProductDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDAO mainDAO;

	@Override
	public ArrayList<ProductDTO> getMainProductarray() throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.getMainProductarray();
	}

	@Override
	public ArrayList<RentalProductDTO> getMainRentalProductarray() throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.getMainRentalProductarray();
	}
	
	@Override
	public ArrayList<RentalProductDTO> getRentalMainRentalProductarray() throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.getRentalMainRentalProductarray();
	}
}
