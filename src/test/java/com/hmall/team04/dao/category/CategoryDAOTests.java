package com.hmall.team04.dao.category;


import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmall.team04.dao.category.CategoryDAO;
import com.hmall.team04.dto.category.CategoryDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CategoryDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	private CategoryDAO categoryDAO;
	
	@Test
	public void testGetCateName() {
		try {
			log.info(categoryDAO.getCategoryName("A2111"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	@Ignore
	public void testGetCategoryList() {
		
		ArrayList<CategoryDTO> list;
		try {
			list = categoryDAO.getCategory();
			
			for(int i=0;i<list.size();i++) {
				log.info(list.get(i));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
//		log.info(vo);
//		vo.getAuthList().forEach(authVO -> log.info(authVO));
		
	}
	
}
