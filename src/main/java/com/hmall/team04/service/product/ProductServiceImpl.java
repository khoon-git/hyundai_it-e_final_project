package com.hmall.team04.service.product;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.product.ProductDAO;
import com.hmall.team04.dto.order.OrderPrdResponseDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService{
	
	private final ProductDAO productDAO;

	@Override
	public OrderPrdResponseDTO getOrderProductByPrdId(String prd_id) throws Exception {
		
		return productDAO.getOrderProductByPrdId(prd_id);
	}
	
	
	
}
