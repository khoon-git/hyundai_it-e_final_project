package com.hmall.team04.controller.review;


import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hmall.team04.dto.cart.CartDTO;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.common.ProductPageDTO;
import com.hmall.team04.dto.common.ReviewCriteria;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;
import com.hmall.team04.dto.common.ReviewPageDTO;
import com.hmall.team04.service.cart.CartService;
import com.hmall.team04.service.file.FileServiceImpl;
import com.hmall.team04.service.product.ProductBoardService;
import com.hmall.team04.service.review.ReviewService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/r")
public class ReviewListController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ProductBoardService productboardService;
	
	@Autowired
	private FileServiceImpl awsS3Service;
	
	@GetMapping(value = "/list", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Object> getProuctList(@RequestParam String categoryCode,
												@RequestParam String prd_board_id,
												@RequestParam int sort,
												@RequestParam int amount,
												@RequestParam int pageNum) throws Exception {
		ArrayList<Object> data = new ArrayList<>();
		ProductCriteria cri = new ProductCriteria(pageNum, amount, categoryCode);
		ArrayList<ProductBoardDTO> productBoardDTO;
		ProductPageDTO pageMaker;

		ArrayList<Object> dataCore = new ArrayList<>();
		ReviewCriteria reviewcri = new ReviewCriteria(pageNum, amount, prd_board_id);
		ArrayList<ReviewDTO> reviewDTO= new ArrayList<ReviewDTO>();
		int totalCore = reviewService.getReviewListCountCore(prd_board_id);
		ReviewPageDTO reviewpageMaker = new ReviewPageDTO(reviewcri,totalCore);
		
		if (sort == 1) {
			reviewDTO = reviewService.getReviewListByInsdtCore(reviewcri);
 			reviewpageMaker = new ReviewPageDTO(reviewcri, totalCore);
		}
//		else if (sort == 2) {
//			productBoardDTO = productboardService.getProductBoardListByRowPrice(cri);
// 			int total = productboardService.getProductListCount(categoryCode);
//			pageMaker = new ProductPageDTO(cri, total);
//		}
//		else {
//			productBoardDTO = productboardService.getProductBoardListByHighPrice(cri);
// 			int total = productboardService.getProductListCount(categoryCode);
//			pageMaker = new ProductPageDTO(cri, total);
//		}

		dataCore.add(reviewDTO);
		dataCore.add(reviewpageMaker);
		return new ResponseEntity<Object>(dataCore, HttpStatus.OK);
	}
	
}