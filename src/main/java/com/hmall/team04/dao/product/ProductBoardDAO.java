package com.hmall.team04.dao.product;

import java.sql.SQLException;
import java.util.ArrayList;

import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.product.ProductBoardDTO;

public interface ProductBoardDAO {
	
	//상품 검색
	ArrayList<ProductBoardDTO> getProductBoardListByKeyword(ProductCriteria cri) throws SQLException;
	
	//상품게시글에 따른 상품리스트
	ArrayList<ProductBoardDTO> getProductBoardListByInsdt(ProductCriteria cri) throws SQLException;
	
	//상품높은가격에 따른 상품리스트
	ArrayList<ProductBoardDTO> getProductBoardListByHighPrice(ProductCriteria cri) throws SQLException;
		
	//상품낮은가격에 따른 상품리스트
	ArrayList<ProductBoardDTO> getProductBoardListByRowPrice(ProductCriteria cri) throws SQLException;

	// 상품 게시판 선택 시 해당 게시판 표시 메소드 ; 게시판이 가지고잇는 게시글들이 상품1개에 상응한다.
	ProductBoardDTO getProductBoard(String prd_board_id) throws SQLException;

	int getProductListCount(String category) throws Exception;

	int getProductListCountByKeyword(String keyword) throws Exception;
}
