package com.hmall.team04.service.product;

import java.util.ArrayList;

import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.product.ProductBoardDTO;

public interface ProductBoardService {
	
	ArrayList<ProductBoardDTO> getProductBoardListByInsdt(ProductCriteria cri) throws Exception;
	
	ArrayList<ProductBoardDTO> getProductBoardListByHighPrice(ProductCriteria cri) throws Exception;
	
	ArrayList<ProductBoardDTO> getProductBoardListByRowPrice(ProductCriteria cri) throws Exception;

	ProductBoardDTO getProductBoard(String prd_board_id)  throws Exception;

	int getProductListCount(String category) throws Exception;

	ArrayList<ProductBoardDTO> getProductBoardListByKeyword(ProductCriteria cri) throws Exception;

	int getProductListCountByKeyword(String keyword) throws Exception;

}
