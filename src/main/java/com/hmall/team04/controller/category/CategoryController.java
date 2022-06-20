package com.hmall.team04.controller.category;


import java.util.ArrayList;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.http.MediaType;
import com.hmall.team04.dto.category.CategoryDTO;
import com.hmall.team04.service.category.CategoryService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class CategoryController {
	
	private CategoryService categoryService;
	
	public CategoryController(CategoryService categoryService) {
		this.categoryService  = categoryService;
	}
	
	@GetMapping(value="/category", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ArrayList<CategoryDTO> getCategory() throws Exception{
		return categoryService.getCategory();
	}
	
	@GetMapping(value="/category/{category}", produces = "application/text;charset=utf-8")
	public String getCategoryName(@PathVariable String category) throws Exception{
		return categoryService.getCategoryName(category);
	}
}
