package com.hmall.team04.controller.rental;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmall.team04.dto.category.CategoryDTO;
import com.hmall.team04.dto.rental.RentalCriteria;
import com.hmall.team04.dto.rental.RentalPageDTO;
import com.hmall.team04.dto.rental.RentalProductDTO;
import com.hmall.team04.service.category.CategoryService;
import com.hmall.team04.service.main.MainService;
import com.hmall.team04.service.rental.RentalProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/rental")
public class RentalProductController {
	
	@Autowired
	private RentalProductService rentalProductService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String rentalmain(Model model) {
		String cate = "";
 		try {
 			ArrayList<RentalProductDTO> rentallsit = mainService.getRentalMainRentalProductarray();
 			ArrayList<CategoryDTO> categorylist = categoryService.getRentalCategory();
			cate = categoryService.getCategoryName("S1900");
			model.addAttribute("categorylist", categorylist);
			model.addAttribute("rentallsit", rentallsit);
			model.addAttribute("category", cate);
			model.addAttribute("categoryCode", "S1900");
			model.addAttribute("sort", 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "rental.rentalProductMain";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public  String productlist( @RequestParam int pageNum,
							    @RequestParam int sort,
							    @RequestParam String keyword,
							    @RequestParam String category, Model model) throws Exception {
		
		RentalCriteria cri = new RentalCriteria(pageNum, category, keyword);
		ArrayList<CategoryDTO> categorylist = categoryService.getRentalCategory();
		int total = 0;
		ArrayList<RentalProductDTO> rentallsit;
		if(sort == 1) {
			rentallsit = rentalProductService.getRentalProductBoardList(cri);
 			total = rentalProductService.getRentalProductBoardListCount(cri);
		}
		else {
			rentallsit = rentalProductService.getAllRentalProductBoardList(cri);
 			total = rentalProductService.getAllRentalProductBoardListCount(cri);
		}
		String categoryName = "";
 		
		categoryName = categoryService.getCategoryName(category);
		model.addAttribute("sort", sort);
		model.addAttribute("pageMaker", new RentalPageDTO(cri, total));
		model.addAttribute("rentallsit", rentallsit);
		model.addAttribute("category", categoryName);
		model.addAttribute("categoryCode", category);
		model.addAttribute("categorylist", categorylist);
		return "rental.rentalProductListBoard";
	}
	
	
	@RequestMapping(value = "/{prd_id}", method = RequestMethod.GET)
	public String product(@PathVariable String prd_id, Model model) throws Exception {
		RentalProductDTO rentalProductDTO = rentalProductService.getRentalProduct(prd_id);
		model.addAttribute("rentalProductDTO", rentalProductDTO);
		return "rental.rentalProductBoard";
	}
	
}
