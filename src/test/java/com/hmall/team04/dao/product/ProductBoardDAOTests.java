package com.hmall.team04.dao.product;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dao.review.ReviewDAO;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.product.ProductDTO;
import com.hmall.team04.dto.review.ReviewDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProductBoardDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	private ProductBoardDAO productboardDAO;
	
	@Setter(onMethod_ = @Autowired)
	private ReviewDAO reviewDAO;
	
	
	@Test
	//@Ignore
	public void testGetProductBoard() {
		
		ProductBoardDTO productboardDTO;
		try {
			productboardDTO = productboardDAO.getProductBoard("201");
			
			for(ProductDTO dto : productboardDTO.getProductList()) {
				log.info(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
