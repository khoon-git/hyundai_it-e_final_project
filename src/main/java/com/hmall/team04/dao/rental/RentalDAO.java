package com.hmall.team04.dao.rental;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderDetailDTO;
import com.hmall.team04.dto.rental.RentalCompleteDTO;

public interface RentalDAO {

	// 주문완료화면 get
	RentalCompleteDTO getRentalOrderComplete(RentalCompleteDTO rentalcompleteDTO) throws Exception;
	
	void insertSuccessRentalOrder(RentalCompleteDTO rentalCompleteDTO) throws Exception;

}
