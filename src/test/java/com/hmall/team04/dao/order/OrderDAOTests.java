package com.hmall.team04.dao.order;


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
import com.hmall.team04.dto.review.ReviewDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class OrderDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	private OrderDAO orderDAO;
	
	@Test
	public void testGetOrderCompleteList() {
		
		ArrayList<OrderCompleteDTO> list;
		
		OrderCompleteDTO ordercompleteDTO = new OrderCompleteDTO();
		ordercompleteDTO.setUser_id("LikeReviewWacher");
		try {
			list = orderDAO.getOrderCompleteList(ordercompleteDTO);
			
			for(int i=0;i<list.size();i++) {
				log.info(list.get(i));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testGetPrdPayment() {
		
		OrderCompleteDTO ordercompleteDTO = new OrderCompleteDTO();
		ordercompleteDTO.setUser_id("1");
		
		try {
			ordercompleteDTO = orderDAO.getPrdPayment(ordercompleteDTO);
			
			log.info(ordercompleteDTO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
