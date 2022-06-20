package com.hmall.team04.service.category;

import java.util.ArrayList;

import com.hmall.team04.dto.category.CategoryDTO;

public interface CategoryService {

	ArrayList<CategoryDTO> getCategory() throws Exception;
	
	ArrayList<CategoryDTO> getRentalCategory() throws Exception;
	
	String getCategoryName(String category) throws Exception;

}
