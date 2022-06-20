package com.hmall.team04.dao.rental;

import java.util.ArrayList;

import com.hmall.team04.dto.rental.RentalCriteria;
import com.hmall.team04.dto.rental.RentalProductDTO;

public interface RentalProductDAO {
	ArrayList<RentalProductDTO> getAllRentalProductBoardList(RentalCriteria cri) throws Exception;
	ArrayList<RentalProductDTO> getRentalProductBoardList(RentalCriteria cri) throws Exception;
	RentalProductDTO getRentalProduct(String prd_id) throws Exception;
	
	int getAllRentalProductBoardListCount(RentalCriteria cri) throws Exception;
	int getRentalProductBoardListCount(RentalCriteria cri) throws Exception;
}
