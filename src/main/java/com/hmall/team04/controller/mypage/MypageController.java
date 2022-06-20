package com.hmall.team04.controller.mypage;

import java.net.URI;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.json.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hmall.team04.dto.common.Criteria;

import com.hmall.team04.dto.cs.QnaDTO;
import com.hmall.team04.dto.mypage.MypageCriteria;
import com.hmall.team04.dto.mypage.MypagePageDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderDetailDTO;

import com.hmall.team04.dto.rental.RentalUserDTO;
import com.hmall.team04.dto.review.ReviewDTO;
import com.hmall.team04.dto.user.CustomUser;

import com.hmall.team04.dto.rental.RentalOrderDTO;

import com.hmall.team04.dto.user.LeaveUserDTO;
import com.hmall.team04.dto.user.UserTDTO;
import com.hmall.team04.service.balance.BalanceService;
import com.hmall.team04.service.coupon.CouponService;
import com.hmall.team04.service.cs.QnaService;
import com.hmall.team04.service.mypage.MypageService;
import com.hmall.team04.service.order.OrderService;
import com.hmall.team04.service.reserve.ReserveService;
import com.hmall.team04.service.user.UserService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@PreAuthorize("hasRole('ROLE_USER')")
@RequestMapping("/mypage")
public class MypageController {
	
	private UserService userService;
	private CouponService couponService;
	private ReserveService reserveService;
	private BalanceService balanceService;
	private OrderService orderService;
	private MypageService mypageService;
	private QnaService qnaService;
	private PasswordEncoder passwordEncoder;
 	

	public MypageController(UserService userService, CouponService couponService, ReserveService reserveService, BalanceService balanceService,
							OrderService orderService, MypageService mypageService, QnaService qnaService, PasswordEncoder passwordEncoder ) {

		this.userService = userService;
		this.couponService = couponService;
		this.reserveService = reserveService;
		this.balanceService = balanceService;
		this.orderService = orderService;
		this.mypageService = mypageService;
		this.qnaService = qnaService;
		this.passwordEncoder = passwordEncoder;
	}
	
	@GetMapping("/odslist") // 첫 주문내역 시작 (14일)
	public String odslist(Principal principal,Model model) {
		try {
			String id = principal.getName(); // user_id;			
			int cnt_step1 = mypageService.getCountStep1(id);
			int cnt_step2 = mypageService.getCountStep2(id);
			int cnt_step3 = mypageService.getCountStep3(id);
			int cnt_step4 = mypageService.getCountStep4(id);
			int cnt_step5 = mypageService.getCountStep5(id);
			MypageCriteria mypageCri = new MypageCriteria();
			mypageCri.setId(id);
			List<OrderDTO> list = mypageService.getPurchasePrdFlag(mypageCri);
			int total = mypageService.getPurchasePrdFlagCount(mypageCri);
			MypagePageDTO pageMaker = new MypagePageDTO(mypageCri,total);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("cnt_step1", cnt_step1);
			model.addAttribute("cnt_step2", cnt_step2);
			model.addAttribute("cnt_step3", cnt_step3);
			model.addAttribute("cnt_step4", cnt_step4);
			model.addAttribute("cnt_step5", cnt_step5);
			model.addAttribute("list",list);
			return "mypage.orderhist.mypageODSList";
		} catch (Exception e) {
			log.info(e.toString());
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "");
			return "redirect";			
		}		
	}
	
	@GetMapping(value = "/odslistdate", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public ResponseEntity<Object> getPurchasePrdFlagByD(Principal principal,@RequestParam String ordStrtDt, 
														@RequestParam String ordEndDt,
											            @RequestParam int amount,
											            @RequestParam int pageNum,
											            @RequestParam String keyword) throws Exception {
		
		ArrayList<Object> data = new ArrayList<>();	
		String id = principal.getName(); // user_id;	
		MypageCriteria mypageCri = new MypageCriteria(ordStrtDt,ordEndDt,pageNum,amount,keyword,id);
		int total = mypageService.getPurchasePrdFlagByDateTotalCount(mypageCri);
		MypagePageDTO pageMaker = new MypagePageDTO(mypageCri,total);
		
		List<OrderDTO> list = mypageService.getPurchasePrdFlagByDate(mypageCri);
		data.add(list);
	    data.add(pageMaker);
		return new ResponseEntity<Object>(data, HttpStatus.OK);		
	}
	
	
	
	@GetMapping("/crelist") // 취소배송반품
	public String crelist(Principal principal,Model model) {
		try {
			String id = principal.getName(); // user_id;			
			int cstep = mypageService.getCountCstep(id);
			int rstep1 = mypageService.getCountRstep1(id);
			int rstep2 = mypageService.getCountRstep2(id);
			int estep1 = mypageService.getCountEstep1(id);
			int estep2 = mypageService.getCountEstep2(id);
			MypageCriteria mypageCri = new MypageCriteria();
			mypageCri.setId(id);
			List<OrderDTO> list = mypageService.getCrePrdFlag(mypageCri);
			int total = mypageService.getCrePrdFlagCount(mypageCri);
			MypagePageDTO pageMaker = new MypagePageDTO(mypageCri,total);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("cstep", cstep);
			model.addAttribute("rstep1", rstep1);
			model.addAttribute("rstep2", rstep2);
			model.addAttribute("estep1", estep1);
			model.addAttribute("estep2", estep2);
			model.addAttribute("list",list);
			return "mypage.orderhist.mypageCREList";
		} catch (Exception e) {
			log.info(e.toString());
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "");
			return "redirect";			
		}				
	}
	
	
	
	@GetMapping(value = "/crelistdate", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public ResponseEntity<Object> getCrePrdFlagByD(Principal principal,@RequestParam String ordStrtDt, 
														@RequestParam String ordEndDt,
											            @RequestParam int amount,
											            @RequestParam int pageNum,
											            @RequestParam String keyword) throws Exception {
		
		ArrayList<Object> data = new ArrayList<>();	
		String id = principal.getName(); // user_id;	
		MypageCriteria mypageCri = new MypageCriteria(ordStrtDt,ordEndDt,pageNum,amount,keyword,id);
		int total = mypageService.getCrePrdFlagByDateTotalCount(mypageCri);
		MypagePageDTO pageMaker = new MypagePageDTO(mypageCri,total);
		
		List<OrderDTO> list = mypageService.getCrePrdFlagByDate(mypageCri);
		data.add(list);
	    data.add(pageMaker);
		return new ResponseEntity<Object>(data, HttpStatus.OK);		
	}
	
	

	

	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/mymain") 
	public String mypage(Principal principal, Model model) {
		try {
			String id = principal.getName();
			String usernm = userService.getUserNamebyUserId(id);
			int coupon_cnt = couponService.getCouponCountbyUserId(id);
			int reserves = reserveService.getReservebyUserId(id); //적립금
			int balances = balanceService.getBalancebyUserId(id); //예치금
			List<OrderDTO> list = mypageService.getPurchasePrd(id,14); //최근주문내역(최근14일)			
			List<QnaDTO> qlist = qnaService.getQnaListFive(id); //최근문의내역
			int grade = mypageService.getUserGrade(id); //유저등급
			model.addAttribute("qlist",qlist);
			model.addAttribute("list",list);
			model.addAttribute("usernm",usernm);
			model.addAttribute("coupon_cnt",coupon_cnt);	
			model.addAttribute("reserves", reserves);
			model.addAttribute("balances", balances);
			model.addAttribute("grade", grade);
			return "mypage.orderhist.mypageMainList";			

		} catch (Exception e) {
			log.info(e.toString());
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "");
			return "redirect";
		}
	}
	
	
	
	
	
	
	@GetMapping("/returnPopup") 
	public String returnpop(@RequestParam("detailid") String detailid, Model model) {
		try {
			List<OrderDetailDTO> list = mypageService.getPopupDetailbyOrderDetailId(detailid);
			model.addAttribute("list",list); //row한줄 list[0].
			return "mypagePopup/returnPopup";
		} catch (Exception e) {
			model.addAttribute("msg", "반품 실패하였습니다.");
			model.addAttribute("url", "");
			return "redirect";
		}	
	}
	@GetMapping("/exchangePopup") 
	public String exchangepop(@RequestParam("detailid") String detailid, Model model) {
		try {
			List<OrderDetailDTO> list = mypageService.getPopupDetailbyOrderDetailId(detailid);
			model.addAttribute("list",list); //row한줄 list[0].
			return "mypagePopup/exchangePopup";
		} catch (Exception e) {
			model.addAttribute("msg", "교환에 실패하였습니다.");
			model.addAttribute("url", "");
			return "redirect";
		}	
	}
	
	
	
	@RequestMapping(value = "/flagUpdateR", method=RequestMethod.POST)
	@ResponseBody
	public String updateFlag(@RequestBody OrderDetailDTO orderdetaildto) {		
		try {	
			mypageService.updateflagR(orderdetaildto);
			return "success";
			
		} catch (Exception e) {
			log.info(e);
			return "fail";
		}					
	}
	
	
	@RequestMapping(value = "/flagUpdateE", method=RequestMethod.POST)
	@ResponseBody
	public String updateFlagE(@RequestBody OrderDetailDTO orderdetaildto) {				
		try {	
			mypageService.updateflagR(orderdetaildto);
			return "success";
			
		} catch (Exception e) {
			log.info(e);
			return "fail";
		}				
	}
	
	
	// 대여 조회 목록
	@GetMapping(value = "/rentalList", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public ResponseEntity<Object> rentalList(Principal principal, @RequestParam(required = false, defaultValue = "", value = "keyword")String keyword) throws Exception {		
		ArrayList<Object> data = new ArrayList<>();	
		String id = principal.getName(); // user_id;
		List<RentalUserDTO> list =  mypageService.getRentalList(id,keyword);
		data.add(list);
		return new ResponseEntity<Object>(data, HttpStatus.OK);		
	}
	
	@GetMapping("/retalListgo")
	public String retalListgo() {
		return "mypage.rental.rentalList";
	}
	
	@GetMapping("/od")
	public ModelAndView orderDetail(Principal principal, @RequestParam String orderNo) {
		ModelAndView mnv = new ModelAndView();
		try {
			mnv.setViewName("mypage.orderhist.orderdetail");
			OrderDTO orderDTO = orderService.getOrderByOrderNo(principal.getName(), orderNo);
			log.info(orderDTO);
			mnv.addObject("orderDTO", orderDTO);
		} catch (Exception e) {
			log.info(e);
			mnv.addObject("msg", "주문내역 출력 에러");
			mnv.addObject("url", "");
			mnv.setViewName("redirect");
		}
		return mnv;
	}
	
	@GetMapping("/oc")
	public ModelAndView orderCancelDetail(Principal principal, @RequestParam String orderDetailNo, @RequestParam String orderNo) {
		ModelAndView mnv = new ModelAndView();
		try {
			mnv.setViewName("mypage.orderhist.ordercancel");
			OrderDetailDTO odDTO = orderService.getOrderDetail(principal.getName(), orderDetailNo);
			OrderDTO oDTO = orderService.getOrderByOrderNo(principal.getName(), orderNo);
			mnv.addObject("odDTO", odDTO);
			mnv.addObject("oDTO", oDTO);
			mnv.addObject("orderNo", orderNo);
			mnv.addObject("orderDetailNo", orderDetailNo);
		} catch (Exception e) {
			log.info(e);
			mnv.addObject("msg", "주문취소 출력 에러");
			mnv.addObject("url", "");
			mnv.setViewName("redirect");
		}
		return mnv;
	}
	
	@GetMapping("/rr")
	public ModelAndView rentalReturn(Principal principal, @RequestParam String rentalorderNo) {
		ModelAndView mnv = new ModelAndView();
		try {
			mnv.setViewName("mypagePopup/rentalReturnPopup");
			RentalUserDTO rentalUserDTO = mypageService.getRentalProduct(rentalorderNo);
			mnv.addObject("rentalUserDTO", rentalUserDTO);
		} catch (Exception e) {
			log.info(e);
			mnv.addObject("msg", "반납접수를 할 수 없습니다.");
			mnv.addObject("url", "");
			mnv.setViewName("redirect");
		}
		return mnv;
	}
	
	@GetMapping("/rentalflagUpdateR")
	@ResponseBody
	public String rentalupdateFlagR(@RequestParam String prd_id, Principal principal) {		
		try {	
			mypageService.rentalupdateFlagR(principal.getName(), prd_id);
			return "success";
			
		} catch (Exception e) {
			log.info(e);
			return "fail";
		}					
	}
	      
	@PostMapping("/oc")
	@ResponseBody
	public ResponseEntity<Void> cancelOrder(@RequestBody HashMap<String, Object> param, Principal principal) {
//		int returnPrice = Integer.parseInt(((String) param.get(0).get("returnPrice")).replaceAll("[^0-9]",""));
//		int returnPoint = Integer.parseInt(((String) param.get(1).get("returnPoint")).replaceAll("[^0-9]",""));
		int updtTotal = Integer.valueOf((String) param.get("updtTotal"));
		int updtDis = Integer.valueOf((String) param.get("updtDis"));
		int updtPmt = Integer.valueOf((String) param.get("updtPmt"));
		int updtRDA = Integer.valueOf((String) param.get("updtRDA"));
		int updtCDA = Integer.valueOf((String) param.get("updtCDA"));
		int updtPC = Integer.valueOf((String) param.get("updtPC"));
		int updtBDA = Integer.valueOf((String) param.get("updtBDA"));
		String updtFlag = String.valueOf(param.get("updtFlag"));
		String orderId = String.valueOf(param.get("orderId"));
		String oDetailId = String.valueOf(param.get("oDetailId"));
		log.info("param : " + param);
		try {
			orderService.updateCancelInfo(updtTotal, updtDis, updtPmt, updtRDA, updtCDA, updtPC, updtBDA, updtFlag, orderId, oDetailId, principal.getName());
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			log.info(e);
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/chngPW")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String changePW() {
		return "mypage.info.modifyPW";
	}
	
	@PostMapping("/chkPW")
	@PreAuthorize("principal.username == #param.get(\"userid\")")
	public @ResponseBody ResponseEntity<String> checkPW(@RequestBody HashMap<String, String> param, Principal principal) {
		if (param.get("oldpw") == null) return new ResponseEntity<>("noString", HttpStatus.INTERNAL_SERVER_ERROR);
		log.info(param);
		try {
			userService.comparePassword(principal.getName(), param.get("oldpw"));
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PostMapping("/chngPW")
	@PreAuthorize("principal.username == #param.get(\"userid\")")
	public @ResponseBody ResponseEntity<Void> updatePW(@RequestBody HashMap<String, String> param, Principal principal) {
		try {
			userService.updatePassword(principal.getName(), param.get("oldpw"), param.get("newpw"));
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
		
	@GetMapping("/deliever")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String getDeliever() {

		
		return "mypage.info.deliever";
	}
	
	@GetMapping("/chngUsrInfo")
	public String changeUserInfo(Principal prin, Model model) {
		try {
			UserTDTO userTDTO = userService.getUserInfo(prin.getName());
			model.addAttribute("userTDTO", userTDTO);
			return "mypage.info.modifyUserInfo";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "데이터를 불러오는데 실패했습니다.");
			model.addAttribute("url", "../");
			return "redirect";
		}
		
	}
	
	@PostMapping("/chngUsrInfo")
	public @ResponseBody ResponseEntity<String> changeUserInfo(@RequestBody UserTDTO userTDTO) {
		// 응답헤더 지정
		HttpHeaders resHeaders = new HttpHeaders();
		resHeaders.add("Content-Type", "application/json;charset=UTF-8");
		try {
			userService.updateUserInfo(userTDTO.getUser_id() , userTDTO);
			
			return new ResponseEntity<>("회원정보 수정이 완료되었습니다.", resHeaders, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();

			return new ResponseEntity<>("회원정보 수정에 실패하였습니다.", resHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/prevModify")
    public String getPrevModify() {
		return "mypage.info.prevModify";
	}

    @PostMapping("/prevModify")
    public String postPrevModify(Principal auth, @RequestParam("pwd") String pw, RedirectAttributes rttr) throws Exception {
        String userpw = userService.getUserInfo(auth.getName()).getPassword();
        if(passwordEncoder.matches(pw, userpw)) {
            log.info("pw 재확인 완료..");
            return "redirect:/mypage/chngUsrInfo";
        }
        else {
            rttr.addFlashAttribute("msg", "비밀번호를 다시 확인해 주세요.");
            return "redirect:/mypage/prevModify";
        }
    }
    
    
    
 // email 중복확인
 	@PostMapping(value = "/checkEmailDupNotMeJSON", produces = MediaType.APPLICATION_JSON_VALUE)
 	public @ResponseBody String checkEmailDupNotMeJSON(Principal principal, @RequestBody String email) { // Y, N 만 보내주면 되기 때문에 String으로 리턴 : ajax에서 받을 때 dataType: 'text'
 		
 		log.info("중복 확인할 이메일 : " + email);
 		//이메일 중복 확인
 		String checkEmailDupNotMeJSON;
 		try {
 			checkEmailDupNotMeJSON = mypageService.checkEmailDup(principal.getName(), email);
 			log.info("아이디 중복 여부: "+checkEmailDupNotMeJSON);
 			return checkEmailDupNotMeJSON;  //JSON으로 데이터 리턴
 		} catch (Exception e) {
 			e.printStackTrace();
 			return "Y";
 		}
 		
 	}
 	
 	// 회원탈퇴 페이지 요청
 	@GetMapping("/leaveUserForm")
	public String leaveUserForm(Principal prin, Model model) {
		return "mypage.info.leaveUserForm";
	}
 	
 	
	// 회원탈퇴 요청
	@PostMapping("/leaveUser")
	public @ResponseBody ResponseEntity<String> leaveUserForm(@RequestBody LeaveUserDTO leaveUserDTO, HttpServletRequest request) {
		log.info("회원 탈퇴 요청 ==== "+leaveUserDTO.toString());
		// 응답헤더 지정
		HttpHeaders resHeaders = new HttpHeaders();
		resHeaders.add("Content-Type", "application/json;charset=UTF-8");
		try {
			
			userService.insertLeaveUser(leaveUserDTO);
			URI redirectUri = new URI(request.getContextPath()+"/customLogout"); // 탈퇴했으니 로그아웃 시키는것임
			resHeaders.setLocation(redirectUri);
			
			return new ResponseEntity<>("회원정보 탈퇴가 완료되었습니다.", resHeaders, HttpStatus.PERMANENT_REDIRECT);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("회원정보 탈퇴에 실패하였습니다.", resHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
 	
 	
	// 회원탈퇴 전 비밀번호 확인
 	@GetMapping("/prevLeave")
 	public String getPrevLeave() {
 		return "mypage.info.prevLeave";
 	}
 	
 	// 회원탈퇴 전 비밀번호 확인
 	@PostMapping("/prevLeave")
    public String postPrevLeave(Principal auth, @RequestParam("pwd") String pw, RedirectAttributes rttr) throws Exception {
        String userpw = userService.getUserInfo(auth.getName()).getPassword();
        if(passwordEncoder.matches(pw, userpw)) {
            log.info("pw 재확인 완료..");
            return "redirect:/mypage/leaveUserForm";
        }
        else {
            rttr.addFlashAttribute("msg", "비밀번호를 다시 확인해 주세요.");
            return "redirect:/mypage/prevLeave";
        }
    }
 	
 	
 	@GetMapping("/rentalReturnList") // 첫 렌탈 내역 시작 (14일)
	public String rentalReturnList(Principal principal, Model model) {
		try {
			String userid = principal.getName();		
			MypageCriteria mypageCri = new MypageCriteria();
			mypageCri.setId(userid);
			Date date = new Date();
			String today = new SimpleDateFormat("yyyyMMdd").format(date);
			mypageCri.setOrdEndDt(today);
			mypageCri.setOrdStrtDt(String.valueOf(Integer.parseInt(today) - 14));
			List<RentalOrderDTO> list = mypageService.getRentalCompPrdByDate(mypageCri);
			int total = mypageService.getRentalCompPrdCountByDate(mypageCri);
			MypagePageDTO pageMaker = new MypagePageDTO(mypageCri,total);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("list",list);
			return "mypage.rental.rentalReturnList";
		} catch (Exception e) {
			log.info(e.toString());
			model.addAttribute("msg", "list 출력 에러");
			model.addAttribute("url", "");
			return "redirect";			
		}
	}
 	
 	@GetMapping(value = "/rentalReturnListAjax", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public ResponseEntity<Object> rentalReturnList(Principal principal,@RequestParam String ordStrtDt, 
														@RequestParam String ordEndDt,
											            @RequestParam int amount,
											            @RequestParam int pageNum,
											            @RequestParam String keyword) {
		try {
		ArrayList<Object> data = new ArrayList<>();	
		String id = principal.getName(); // user_id;	
		MypageCriteria mypageCri = new MypageCriteria(ordStrtDt,ordEndDt,pageNum,amount,keyword,id);
		int total = mypageService.getRentalCompPrdCountByDate(mypageCri);
		MypagePageDTO pageMaker = new MypagePageDTO(mypageCri,total);
		
		List<RentalOrderDTO> list = mypageService.getRentalCompPrdByDate(mypageCri);
		data.add(list);
	    data.add(pageMaker);
	    log.info("list : " + list);
	    log.info("pageMaker : " + pageMaker);
	    log.info("data : " + data);
	    return new ResponseEntity<Object>(data, HttpStatus.OK);		
		} catch(Exception e) {
			return new ResponseEntity<Object>(e, HttpStatus.BAD_REQUEST);
		}
	}
}
