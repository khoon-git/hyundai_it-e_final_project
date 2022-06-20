package com.hmall.team04.service.rental;

import java.util.ArrayList;
import java.util.List;

import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderDetailDTO;
import com.hmall.team04.dto.rental.RentalCompleteDTO;

public interface RentalService {
	// 주문완료화면 get
	RentalCompleteDTO getRentalComplete(RentalCompleteDTO rentalDTO) throws Exception;

	void insertSuccessRentalOrder(RentalCompleteDTO rentalCompleteDTO) throws Exception;
	
}
