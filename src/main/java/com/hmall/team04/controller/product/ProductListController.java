package com.hmall.team04.controller.product;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.common.ProductPageDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.service.product.ProductBoardService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/p")
public class ProductListController {
	
	@Autowired
	private ProductBoardService productboardService;
	
	@GetMapping(value = "/list", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Object> getProuctList(@RequestParam String categoryCode, 
												@RequestParam int sort,
												@RequestParam int amount,
												@RequestParam int pageNum) throws Exception {
		ArrayList<Object> data = new ArrayList<>();
		ProductCriteria cri = new ProductCriteria(pageNum, amount, categoryCode);
		ArrayList<ProductBoardDTO> productBoardDTO;
		ProductPageDTO pageMaker;
		if (sort == 1) {
			productBoardDTO = productboardService.getProductBoardListByInsdt(cri);
 			int total = productboardService.getProductListCount(categoryCode);
			pageMaker = new ProductPageDTO(cri, total);
		}
		else if (sort == 2) {
			productBoardDTO = productboardService.getProductBoardListByRowPrice(cri);
 			int total = productboardService.getProductListCount(categoryCode);
			pageMaker = new ProductPageDTO(cri, total);
		}
		else {
			productBoardDTO = productboardService.getProductBoardListByHighPrice(cri);
 			int total = productboardService.getProductListCount(categoryCode);
			pageMaker = new ProductPageDTO(cri, total);
		}
		data.add(productBoardDTO);
		data.add(pageMaker);
		return new ResponseEntity<Object>(data, HttpStatus.OK);
	}
	
	@GetMapping(value = "/search", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Object> getProuctListByKeyword(@RequestParam String keyword, 
														 @RequestParam int pageNum) throws Exception {
		ArrayList<Object> data = new ArrayList<>();
		ProductCriteria cri = new ProductCriteria(pageNum, keyword);
		ArrayList<ProductBoardDTO> productBoardDTO;
		ProductPageDTO pageMaker;
	
		productBoardDTO = productboardService.getProductBoardListByKeyword(cri);
		int total = productboardService.getProductListCountByKeyword(keyword);
		pageMaker = new ProductPageDTO(cri, total);
		
		data.add(productBoardDTO);
		data.add(pageMaker);
		return new ResponseEntity<Object>(data, HttpStatus.OK);
	}
	
}
