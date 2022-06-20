package com.hmall.team04.controller;


import java.util.ArrayList;
import java.util.Locale;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hmall.team04.dto.product.ProductDTO;
import com.hmall.team04.dto.rental.RentalProductDTO;
import com.hmall.team04.service.category.CategoryService;
import com.hmall.team04.service.main.MainService;
import com.hmall.team04.service.product.ProductBoardService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class HomeController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		
		
		ArrayList<ProductDTO> productlist = mainService.getMainProductarray();
		ArrayList<RentalProductDTO> rentalproductlist = mainService.getMainRentalProductarray();
		
		model.addAttribute("productlist", productlist);
		model.addAttribute("rentalproductlist", rentalproductlist);
		
		return "index";
	}
	
}
