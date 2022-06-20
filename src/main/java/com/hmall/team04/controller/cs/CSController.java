package com.hmall.team04.controller.cs;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hmall.team04.dto.cs.NoticeDTO;
import com.hmall.team04.dto.cs.QnaDTO;
import com.hmall.team04.service.cs.NoticeService;
import com.hmall.team04.service.cs.QnaService;
import com.hmall.team04.service.review.ReviewService;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.PageDTO;
import com.hmall.team04.dto.cs.FaqDTO;
import com.hmall.team04.service.cs.FaqService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cs")
public class CSController {

//	@Value("${pageSize}")
//	private long pageSize;
//	
//	@Value("${blockSize}")
//	private long blockSize;

	private NoticeService noticeService;
	private FaqService faqService;
	private QnaService qnaService;

	public CSController(FaqService faqService, NoticeService noticeService, QnaService qnaService) {
		this.faqService = faqService;
		this.noticeService = noticeService;
		this.qnaService = qnaService;
	}

	@GetMapping("/main")
	public String main(Model model) throws Exception {
		try {
			List<FaqDTO> list = faqService.getfaqList();
			List<NoticeDTO> Nlist = noticeService.getNoticeListFive();
			model.addAttribute("list", list);
			model.addAttribute("Nlist", Nlist);
			return "cs.faq.faqMainList";
		} catch (Exception e) {
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "index");
			return "result";
		}

	}

	@GetMapping("/noticeList")
	public String noticeList(Criteria cri, Model model) {
		int total;
		try {
			List<NoticeDTO> list = noticeService.getNoticeList(cri);
			log.info(list);
			model.addAttribute("list", list);
			total = noticeService.getBoardCount(cri);
			model.addAttribute("pageMaker", new PageDTO(cri, total));
			return "cs.notice.noticeList";
		} catch (Exception e) {
			log.info(e);
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "/cs/main");
			return "redirect";
		}
	}

	@GetMapping("/noticeView")
	public String noticeView(@RequestParam String articleid, Model model) {

		NoticeDTO article;

		try {
			article = noticeService.getNoticeArticle(articleid);
			log.info("nV" + article);
			model.addAttribute("article", article);
			return "cs.notice.noticeDetail";

		} catch (Exception e) {
			log.info(e);
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "index");
			return "redirect";
		}

	}

	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/qnaInsPopUp")
	public String qnaInsert() {
		return "cs/qna/qnaInsertPopup";
	}

//	@PostAuthorize()
	@RequestMapping(value = "/qnaInsert", method = RequestMethod.POST)
	public ModelAndView qnaInsert(@ModelAttribute QnaDTO qnadto, ModelAndView mnv) {
		try {
			log.info("qnaInsert");
			qnaService.insertQna(qnadto);
			mnv.addObject("msg", "1:1 상담이 정상적으로 등록되었습니다.");
			mnv.addObject("url", "window.close()");
		} catch (Exception e) {
			log.info(e);
			mnv.addObject("msg", "1:1 상담이 정상적으로 등록되지 않았습니다. 다시 시도해주세요");
			mnv.addObject("url", "window.close()");
		}
		mnv.setViewName("redirect");
		return mnv;
	}

	@GetMapping("/findInOrder")
	public String findInOrder() {
		return "cs/qna/orderListPopup";
	}

//	@PostMapping("/findInOrder")
//	public String findInOrderIns() {
//		
//	}

	@GetMapping("/findInCart")
	public String findInCart() {
		return "cs/qna/cartListPopup";
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/qna")
	public String qnaList(Principal principal, Criteria cri, Model model) {
		int total;
		try {
			List<QnaDTO> list = qnaService.getQnaList(principal.getName(), cri);
			log.info(list);
			model.addAttribute("list", list);
			total = qnaService.getBoardCount(principal.getName(), cri);
			model.addAttribute("pageMaker", new PageDTO(cri, total));
			return "cs.qna.qnaList";
		} catch (Exception e) {
			log.info(e);
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "/cs/main");
			return "redirect";
		}
	}
	
	@GetMapping("/faq")
	public String faqList(Model model) {
		try {
			List<FaqDTO> list = faqService.getfaqListAll(); 
			model.addAttribute("list", list);
			return "cs.faq.faqList";
		}
		catch(Exception e ) {
			model.addAttribute("msg","list 출력 에러");
			model.addAttribute("url","/cs/main"); 
			return "redirect";
		}
	}
}
