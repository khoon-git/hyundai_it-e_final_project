package com.hmall.team04.dao.rental;


import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dao.review.ReviewDAO;
import com.hmall.team04.dto.cart.CartDTO;
import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.rental.RentalCompleteDTO;
import com.hmall.team04.dto.review.ReviewDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class RentalDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	private RentalDAO rentalDAO;
	
	@Test
	public void testGetRentalCompleteList() throws Exception {
		
		
		RentalCompleteDTO rentalcompleteDTO = new RentalCompleteDTO();
		rentalcompleteDTO.setUser_id("a111");
		
		try {
			RentalCompleteDTO dto = rentalDAO.getRentalOrderComplete(rentalcompleteDTO);
			log.info(dto);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
