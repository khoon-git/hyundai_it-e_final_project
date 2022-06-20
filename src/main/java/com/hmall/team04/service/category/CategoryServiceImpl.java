package com.hmall.team04.service.category;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.category.CategoryDAO;
import com.hmall.team04.dto.category.CategoryDTO;

@Service
public class CategoryServiceImpl implements CategoryService{
	private CategoryDAO categoryDAO;
	
	public CategoryServiceImpl(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}
	
	@Override
	public ArrayList<CategoryDTO> getCategory() throws Exception {
		// TODO Auto-generated method stub
		return categoryDAO.getCategory();
	}
	
	@Override
	public ArrayList<CategoryDTO> getRentalCategory() throws Exception {
		// TODO Auto-generated method stub
		return categoryDAO.getRentalCategory();
	}

	@Override
	public String getCategoryName(String category) throws Exception {
		// TODO Auto-generated method stub
		return categoryDAO.getCategoryName(category);
	}

}
