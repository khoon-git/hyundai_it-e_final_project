package com.hmall.team04.service.main;

import java.util.ArrayList;

import com.hmall.team04.dto.product.ProductDTO;
import com.hmall.team04.dto.rental.RentalProductDTO;

public interface MainService {

	ArrayList<ProductDTO> getMainProductarray() throws Exception;
	
	ArrayList<RentalProductDTO> getMainRentalProductarray() throws Exception;
	
	ArrayList<RentalProductDTO> getRentalMainRentalProductarray() throws Exception;
}
