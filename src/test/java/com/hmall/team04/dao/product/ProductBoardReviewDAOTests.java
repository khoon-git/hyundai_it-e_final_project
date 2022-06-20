package com.hmall.team04.dao.product;


import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hmall.team04.dao.file.FileDAO;
import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dao.review.ReviewDAO;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.ReviewCriteria;
import com.hmall.team04.dto.common.ReviewPageDTO;
import com.hmall.team04.dto.file.FileDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
	})
public class ProductBoardReviewDAOTests {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewDAO reviewDAO;
	
	@Setter(onMethod_ = @Autowired)
	private FileDAO fileDAO;
	
//	@Value("${s3.bucketname}")
	private String bucketname;

//	@Value("${s3.accesskey}")
	private String accessKey;
	
//	@Value("${s3.secretkey}")
	private String secretKey;
////	@Value("${s3.bucketname}")
//	private String bucketname;
//
////	@Value("${s3.accesskey}")
//	private String accessKey;
//	
////	@Value("${s3.secretkey}")
//	private String secretKey;
//
//	@Value("${s3.bucketname}")
//	private String BUCKET_NAME;
//
//	@Value("${s3.accesskey}")
//	private String ACCESS_KEY;
//	
//	@Value("${s3.secretkey}")
//	private String SECRET_KEY;

	
	@Test
	public void testprint() {

		log.info(bucketname);
		log.info(accessKey);
		log.info(accessKey);
	}
	
	@Test
	public void testInsertReviewProductBoard() {
		// review_t
		String prd_board_id="1035";
		String prd_id="1055";
		
		String user_id="user";
		String content1="제품이 고급스럽습니다.";
		String content2="마침 고급 롱 원피스를 찾고 있었는데 굉장히 만족스럽습니다.";
		String content3="역시 인정합니다.";
		String content4="보온성도 정말 좋습니다.";
		
		ArrayList<String> contentList = new ArrayList<String>();
		contentList.add(content1);
		contentList.add(content2);
		contentList.add(content3);
		contentList.add(content4);
		
		
		int star=4;
		int file_yn=0;
		

		ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		
		for(int i=0;i<100;i++) {
			ReviewDTO reviewDTO = new ReviewDTO();
			
			reviewDTO.setPrd_board_id(prd_board_id);
			reviewDTO.setPrd_id(prd_id);
			reviewDTO.setUser_id(user_id+ Integer.toString(i));
			reviewDTO.setContent(contentList.get(i%4));
			reviewDTO.setStar(star);
			reviewDTO.setFile_yn(file_yn);
			
			log.info(reviewDTO);
			reviewList.add(reviewDTO);
		}
		
		try {
			
			for(int i=0;i<100;i++) {
				ReviewDTO reviewDTO = reviewList.get(i);
				reviewDAO.insertReview(reviewDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testgetReviewListByInsdtCore() {
		// review_t
		ReviewCriteria reviewcri = new ReviewCriteria(1, 10, "200");
		ArrayList<ReviewDTO> reviewDTO = null;
		ReviewPageDTO reviewpageMaker = null;
		
		ArrayList<FileDTO> fileDTO = null;
		
		try {
			reviewDTO = reviewDAO.getReviewListByInsdtCore(reviewcri);
			
			for(int i=0;i<reviewDTO.size();i++) {
				log.info(reviewDTO.get(i));
				
				if(reviewDTO.get(i).getFile_yn()==1) {
					FileDTO file = new FileDTO();
					file.setArticle_id(reviewDTO.get(i).getReview_id());
					file.setBoard_flag("review");
					
					fileDTO = fileDAO.getReviewFileList(file);
					reviewDTO.get(i).setFileList(fileDTO);
					log.info(reviewDTO.get(i));
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}