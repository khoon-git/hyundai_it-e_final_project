package com.hmall.team04.service.review;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.hmall.team04.dao.file.FileDAO;
import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dao.review.ReviewDAO;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.PageDTO;
import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.common.ReviewCriteria;
import com.hmall.team04.dto.file.FileDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = { @Autowired })
	private ProductBoardDAO productboardDAO;
	
	@Setter(onMethod_ = { @Autowired })
	private ReviewDAO reviewDAO;
	
	@Setter(onMethod_ = { @Autowired })
	private FileDAO fileDAO;
	
	@Override
	public ArrayList<ReviewDTO> getReviewListByInsdtCore(ReviewCriteria reviewcri) throws Exception {
		// 읽어들인 Review의 file_yn이 1이면 추가로 사진 정보를 읽어온다.
		ArrayList<ReviewDTO> reviewDTO = reviewDAO.getReviewListByInsdtCore(reviewcri);
		
		for(int i=0;i<reviewDTO.size();i++) {
			
			if(reviewDTO.get(i).getFile_yn()==1) {
				FileDTO file = new FileDTO();
				file.setArticle_id(reviewDTO.get(i).getReview_id());
				file.setBoard_flag("review");
				reviewDTO.get(i).setFileList(fileDAO.getReviewFileList(file));
			}
		}
		
		return reviewDTO;
	}
	
	@Override
	public int getReviewListCountCore(String prd_board_id) throws Exception{
		// TODO Auto-generated method stub
		return reviewDAO.getReviewListCountCore(prd_board_id);
	}
	
	@Override
	@Transactional
	public void insertReview(ReviewDTO reviewDTO) throws Exception {
		try {
		reviewDAO.insertReview(reviewDTO);
		// update star of related board
		reviewDAO.updateAvgStar(reviewDTO);
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	}

	
	@Override
	public int ReviewIsExist(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.ReviewIsExist(reviewDTO);
	}

	@Override
	public int ReviewIsPossible(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.ReviewIsPossible(reviewDTO);
	}

	@Override
	@Transactional
	public void deleteReview(ReviewDTO reviewDTO) throws Exception {
		try {
		// delete derivatives of certain row of review that will be deleted
		FileDTO fileDTO = new FileDTO();
		fileDTO.setArticle_id(reviewDTO.getReview_id());
		fileDTO.setBoard_flag("review");
		fileDAO.deleteReviewfile(fileDTO);
		
		// delete certain row
		reviewDAO.deleteReview(reviewDTO);
		
		// update star of related board
		reviewDAO.updateAvgStar(reviewDTO);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int BoardReviewIsExist(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.BoardReviewIsExist(reviewDTO);
	}

	
}
