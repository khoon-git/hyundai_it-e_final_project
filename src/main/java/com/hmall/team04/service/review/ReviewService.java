package com.hmall.team04.service.review;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.common.ReviewCriteria;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

public interface ReviewService {
	
	// 상품상세(게시판) 별 댓글 리스트, 페이징과 함께
	ArrayList<ReviewDTO> getReviewListByInsdtCore(ReviewCriteria reviewcri) throws Exception;
	
	int getReviewListCountCore(String prd_board_id) throws Exception;

	// 댓글 등록
	void insertReview(ReviewDTO reivewDTO) throws Exception;
	
	// 댓글 등록 여부 판단
	int ReviewIsExist(ReviewDTO reviewDTO) throws Exception;

	int ReviewIsPossible(ReviewDTO reviewDTO) throws Exception;

	// 댓글 삭제
	void deleteReview(ReviewDTO reviewDTO) throws Exception;

	int BoardReviewIsExist(ReviewDTO reviewDTO) throws Exception;


}
