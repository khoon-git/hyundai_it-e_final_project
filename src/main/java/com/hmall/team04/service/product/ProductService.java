package com.hmall.team04.service.product;

import com.hmall.team04.dto.order.OrderPrdResponseDTO;

public interface ProductService {

	OrderPrdResponseDTO getOrderProductByPrdId(String prd_id) throws Exception;
	
}
