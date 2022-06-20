package com.hmall.team04.dao.cart;


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
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CartDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	private CartDAO cartDAO;
	
	@Test
	public void testGetCartList() {
		
		ArrayList<CartDTO> list;
		try {
			list = cartDAO.getCartList("1");
			
			for(int i=0;i<list.size();i++) {
				log.info(list.get(i));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void testDeleteCart() {
		
		CartDTO cartDTO = new CartDTO();
		cartDTO.setPrd_cart_id("prd_cart_id_tmp1");
		try {
			cartDAO.deleteCart(cartDTO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
