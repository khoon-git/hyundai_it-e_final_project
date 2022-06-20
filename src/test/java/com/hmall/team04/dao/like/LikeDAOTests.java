package com.hmall.team04.dao.like;


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
import com.hmall.team04.dto.like.LikeDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class LikeDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	private LikeDAO likeDAO;
	
	@Test
	public void testGetLikeCnt() {
		
		int cnt=0;
		try {
			cnt = likeDAO.getLikeCnt("prd_board_id_tmp1");
			
			log.info(cnt);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void testInsertLike() {
		
		LikeDTO likeDTO = new LikeDTO();
		
		likeDTO.setPrd_board_id("prd_board_id_tmp1");
		likeDTO.setUser_id("1");
		
		int cnt=0;
		try {
			likeDAO.InsertLike(likeDTO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void testlikeIsExist() {
		
		LikeDTO likeDTO = new LikeDTO();
		likeDTO.setPrd_board_id("prd_board_id_tmp1");
		likeDTO.setUser_id("1");
		
		try {
			int cnt=likeDAO.likeIsExist(likeDTO);
			log.info(cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void testDeleteLike() {
		LikeDTO likeDTO = new LikeDTO();
		
		likeDTO.setPrd_board_id("prd_board_id_tmp1");
		likeDTO.setUser_id("1");
		
		try {
			likeDAO.DeleteLike(likeDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
