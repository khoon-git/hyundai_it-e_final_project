package com.hmall.team04.controller.cs;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmall.team04.dto.cs.FaqDTO;
import com.hmall.team04.service.cs.FaqService;
import com.hmall.team04.service.cs.NoticeService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/cs/faq")
public class FaqController {
	
	private FaqService faqService;

	public FaqController(FaqService faqService) {
		this.faqService = faqService;
	}


	
	@GetMapping("/faqView")
	public String faqList(@RequestParam String faq_flag, Model model) {
		log.info(faq_flag);
		try {
			List<FaqDTO> list =  faqService.getfaqListFlag(faq_flag);
			model.addAttribute("list",list);
			return "cs.faq.faqList"; 
		} catch (Exception e) {
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "/cs/main"); 
			return "redirect";
		}
		
	}
	
	@GetMapping("/faqSearch")
	public String faqSearch(@RequestParam String keyword , Model model) {
		log.info(keyword);
		try {
			List<FaqDTO> list =  faqService.getfaqListFind(keyword);
			model.addAttribute("list",list);
			return "cs.faq.faqList"; 
		} catch (Exception e) {
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "/cs/main");
			return "redirect";
		}
		
	}
	
}
