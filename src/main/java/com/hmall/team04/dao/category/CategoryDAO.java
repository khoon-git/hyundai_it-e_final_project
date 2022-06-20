package com.hmall.team04.dao.category;

import java.sql.SQLException;
import java.util.ArrayList;

import com.hmall.team04.dto.category.CategoryDTO;

public interface CategoryDAO {
	ArrayList<CategoryDTO> getCategory() throws SQLException;
	
	ArrayList<CategoryDTO> getRentalCategory() throws SQLException;

	String getCategoryName(String category) throws Exception;
}
