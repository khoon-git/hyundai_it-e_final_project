package com.hmall.team04.dao.product;

import java.sql.SQLException;
import java.util.ArrayList;

import com.hmall.team04.dto.category.CategoryDTO;
import com.hmall.team04.dto.order.OrderPrdResponseDTO;

public interface ProductDAO {
	ArrayList<CategoryDTO> getCategoryList() throws SQLException;

	OrderPrdResponseDTO getOrderProductByPrdId(String prd_id) throws SQLException;;
	
}
