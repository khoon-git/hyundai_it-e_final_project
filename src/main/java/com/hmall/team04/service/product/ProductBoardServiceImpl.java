package com.hmall.team04.service.product;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.product.ProductBoardDTO;

import lombok.Setter;

@Service
public class ProductBoardServiceImpl implements ProductBoardService {

	@Setter(onMethod_ = { @Autowired })
	private ProductBoardDAO productboardDAO;

	@Override
	public ProductBoardDTO getProductBoard(String prd_board_id) throws Exception {
		// TODO Auto-generated method stub
		return productboardDAO.getProductBoard(prd_board_id);
	}



	@Override
	public int getProductListCount(String category) throws Exception{
		// TODO Auto-generated method stub
		return productboardDAO.getProductListCount(category);
	}

	@Override
	public ArrayList<ProductBoardDTO> getProductBoardListByInsdt(ProductCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return productboardDAO.getProductBoardListByInsdt(cri);
	}

	@Override
	public ArrayList<ProductBoardDTO> getProductBoardListByHighPrice(ProductCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return productboardDAO.getProductBoardListByHighPrice(cri);
	}

	@Override
	public ArrayList<ProductBoardDTO> getProductBoardListByRowPrice(ProductCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return productboardDAO.getProductBoardListByRowPrice(cri);
	}



	@Override
	public ArrayList<ProductBoardDTO> getProductBoardListByKeyword(ProductCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return productboardDAO.getProductBoardListByKeyword(cri);
	}



	@Override
	public int getProductListCountByKeyword(String keyword) throws Exception {
		// TODO Auto-generated method stub
		return productboardDAO.getProductListCountByKeyword(keyword);
	}

}
