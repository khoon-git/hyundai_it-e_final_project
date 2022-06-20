package com.hmall.team04.controller.product;


import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.common.ProductPageDTO;
import com.hmall.team04.dto.common.ReviewCriteria;
import com.hmall.team04.dto.common.ReviewPageDTO;
import com.hmall.team04.dto.like.LikeDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;
import com.hmall.team04.service.category.CategoryService;
import com.hmall.team04.service.file.FileServiceImpl;
import com.hmall.team04.service.like.LikeService;
import com.hmall.team04.service.product.ProductBoardService;
import com.hmall.team04.service.review.ReviewService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/p")
public class ProductBoardController {
	
	@Autowired
	private ProductBoardService productboardService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private FileServiceImpl awsS3Service;
	
	@RequestMapping(value = "/productlist", method = RequestMethod.GET)
	public String productlist(@RequestParam String category,Model model) {
		String cate = "";
		ProductCriteria cri = new ProductCriteria(category);
		
 		try {
 			ArrayList<ProductBoardDTO> productBoardDTO = productboardService.getProductBoardListByInsdt(cri);
 			int total = productboardService.getProductListCount(category);
			cate = categoryService.getCategoryName(category);
			model.addAttribute("pageMaker", new ProductPageDTO(cri, total));
			model.addAttribute("productBoardDTO", productBoardDTO);
			model.addAttribute("category", cate);
			model.addAttribute("categoryCode", category);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product.productListBoard";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String productlistbykeyword(@RequestParam String keyword, Model model) {
		ProductCriteria cri = new ProductCriteria(1, keyword);
		
 		try {
 			ArrayList<ProductBoardDTO> productBoardDTO = productboardService.getProductBoardListByKeyword(cri);
 			int total = productboardService.getProductListCountByKeyword(keyword);
			model.addAttribute("pageMaker", new ProductPageDTO(cri, total));
			model.addAttribute("productBoardDTO", productBoardDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "product.productSearchBoard";
	}
	
	@RequestMapping(value = "/{prd_board_id}", method = RequestMethod.GET)
	public String product(@PathVariable String prd_board_id, Model model,Principal principal) {
		log.info("소분류에서 상품 선택에 따른 페이지");
		log.info(prd_board_id);
		
		String user_id="";
		
		if(principal != null) {
			// 로그인 상태에서 Like 여부 판단
			user_id=principal.getName();
			
			LikeDTO likeDTO = new LikeDTO();
			likeDTO.setPrd_board_id(prd_board_id);
			likeDTO.setUser_id(user_id);
			
			// 로그인 상태에서 review 존재 여부 판단
			ReviewDTO reviewDTO = new ReviewDTO();
			reviewDTO.setPrd_board_id(prd_board_id);
			reviewDTO.setUser_id(user_id);
			
			try {
				int likeIsExist = likeService.likeIsExist(likeDTO);
				int reviewIsPossible = reviewService.ReviewIsPossible(reviewDTO);
				
				model.addAttribute("likeIsExist", likeIsExist);
				model.addAttribute("reviewIsPossible", reviewIsPossible);
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
		
		ReviewCriteria reviewcri = new ReviewCriteria(prd_board_id);
		
		try {
			// 상품 게시판 가져오기
			ProductBoardDTO productboadDTO = productboardService.getProductBoard(prd_board_id);
			log.info(productboadDTO.toString());
			
			// 상품게시판(제품상세)의 댓글 가져오기
 			ArrayList<ReviewDTO> reviewDTO = reviewService.getReviewListByInsdtCore(reviewcri);
 			int totalCore = reviewService.getReviewListCountCore(prd_board_id);
 			ReviewPageDTO reviewpageDTO = new ReviewPageDTO(reviewcri, totalCore);
 			
			model.addAttribute("reviewpageMaker", reviewpageDTO);
			model.addAttribute("reviewDTO", reviewDTO);
			model.addAttribute("prd_board_id", prd_board_id);
			
			// like ; 비로그인 상태
			int likeCnt = likeService.getLikeCnt(prd_board_id);
			
			
			model.addAttribute("productboadDTO", productboadDTO);
			model.addAttribute("likeCnt", likeCnt);

		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return "product.productBoard";
	}
	
}
