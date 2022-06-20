package com.hmall.team04.dao.cart;

import java.sql.SQLException;
import java.util.ArrayList;

import com.hmall.team04.dto.cart.CartDTO;
import com.hmall.team04.dto.category.CategoryDTO;

public interface CartDAO {
	ArrayList<CartDTO> getCartList(String user_id) throws SQLException;

	void deleteCart(CartDTO cartDTO) throws SQLException;

	void updatePrdCartQty(CartDTO cartDTO) throws SQLException;

	void InsertPrdCart(CartDTO cartDTO) throws SQLException;


}
