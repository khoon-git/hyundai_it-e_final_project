package com.hmall.team04.controller.rental;


import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.coupon.CouponDTO;
import com.hmall.team04.dto.deliever.DelieverDTO;
import com.hmall.team04.dto.order.OrderPrdRequestDTO;
import com.hmall.team04.dto.rental.RentalCompleteDTO;
import com.hmall.team04.dto.rental.RentalPrdRequestDTO;
import com.hmall.team04.dto.rental.RentalPrdResponseDTO;
import com.hmall.team04.dto.rental.RentalProductDTO;
import com.hmall.team04.service.balance.BalanceService;
import com.hmall.team04.service.coupon.CouponService;
import com.hmall.team04.service.deliever.DelieverService;
import com.hmall.team04.service.rental.RentalProductService;
import com.hmall.team04.service.rental.RentalService;
import com.hmall.team04.service.reserve.ReserveService;
import com.hmall.team04.service.user.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/rental")
public class RentalController {
	
	private final DelieverService delieverService;
	private final RentalService rentalService;
	private final RentalProductService rentalProductService;
	private final ReserveService reserveService;
	private final UserService userService;
	private final CouponService couponService;
	private final BalanceService balanceService;
	
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/rentalOrder", method = { RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> rentalOrder(@RequestBody RentalPrdRequestDTO rentalPrdRequestDTO, HttpServletRequest req, HttpServletResponse res) throws Exception {

		log.info(rentalPrdRequestDTO.toString());
		
		// 컨트롤러 간 공용 임시저장소인 session 을 불러와, orderInfo라는 key에 orderList를 value로 저장
		HttpSession session = req.getSession();
		session.setAttribute("rentalInfo", rentalPrdRequestDTO);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("orderSuccess", "True");

		return map;
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/rentalOrder", method = RequestMethod.GET)
	public String rentalOrder(HttpServletRequest req, HttpServletResponse res, Model model, Principal principal) {
		String user_id = principal.getName();
		
		
		HttpSession session = req.getSession();
		RentalPrdRequestDTO rentalPrdRequestDTO = new RentalPrdRequestDTO();
		rentalPrdRequestDTO = (RentalPrdRequestDTO) session.getAttribute("rentalInfo");
		
		log.info("================================"+rentalPrdRequestDTO.toString()); //prd_id = 25, ticket = 7		
		
		RentalPrdResponseDTO rentalPrdResponseDTO = new RentalPrdResponseDTO();
		DelieverDTO activeDeliever = null;
		String user_nm = null;
		CouponDTO top1Coupon = null;
		int user_reserve = 0;
		int user_balance = 0;
		Date now = new Date();
		
		try {
			
			RentalProductDTO rentalProductDTO = rentalProductService.getRentalProduct(rentalPrdRequestDTO.getPrd_id()); // dto : 해당 대여상품에 대한 정보
			
			rentalPrdResponseDTO.setPrd_id(rentalProductDTO.getPrd_id());
			rentalPrdResponseDTO.setPrd_nm(rentalProductDTO.getPrd_nm());
			rentalPrdResponseDTO.setPrd_image(rentalProductDTO.getPrd_image());
			rentalPrdResponseDTO.setCategory(rentalProductDTO.getCategory());
			rentalPrdResponseDTO.setTicket(rentalPrdRequestDTO.getTicket());
			
			if (rentalPrdRequestDTO.getTicket() == 7) { //7일 대여 상품일 경우
				rentalPrdResponseDTO.setPrd_price(rentalProductDTO.getPrd_price_7());
			} else if (rentalPrdRequestDTO.getTicket() == 14) { //14일 대여상품일 경우
				rentalPrdResponseDTO.setPrd_price(rentalProductDTO.getPrd_price_14());
			} else { //없어도됨
				rentalPrdResponseDTO.setPrd_price(0);
			}
			
			rentalPrdResponseDTO.setSdate(now);
			// rentalPrdRequestDTO.getTicket() == 7 이면 현재시간+7, 14면 현재시간+14
			rentalPrdResponseDTO.setEdate(new Date(now.getTime() + (rentalPrdRequestDTO.getTicket()*24*60*60*1000) ));
			
			
			activeDeliever = delieverService.selectDelieverActiveYnByUserId(user_id); //배송지 정보
			user_nm = userService.getUserNamebyUserId(user_id); //유저명
			top1Coupon = couponService.selectCouponTop1ByUserId(user_id);
			user_reserve = reserveService.getReservebyUserId(user_id); //적립금 정보
			user_balance = balanceService.getBalancebyUserId(user_id);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("activeDeliever", activeDeliever); //배송지 정보
		model.addAttribute("user_nm", user_nm); //유저명
		model.addAttribute("user_reserve", user_reserve); // 적립금정보
		model.addAttribute("rentalProduct", rentalPrdResponseDTO); //상품정보
		model.addAttribute("top1Coupon", top1Coupon);
		model.addAttribute("user_balance", user_balance);
		

		return "rental.rentalOrder";
	}
	
	
	/* 대여하기 결제 완료시 요청 */
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/rentalComplete", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public void rentalComplete(@RequestBody RentalCompleteDTO rentalCompleteDTO, Principal principal) {

		Date now = new Date();
		
		log.info(rentalCompleteDTO.toString());
		rentalCompleteDTO.setSdate(now);
		rentalCompleteDTO.setEdate(new Date(now.getTime() + (rentalCompleteDTO.getTicket()*24*60*60*1000) )); //현재시간에서 대여일수(ticket)를 더함
		
		try {
			rentalService.insertSuccessRentalOrder(rentalCompleteDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/rentalComplete", method= RequestMethod.GET)
	public String rental(Model model, Principal principal) {
		
		if(principal==null) {
			return "user.login.login";
		}else {
			try {
				RentalCompleteDTO rentalCompleteDTO = new RentalCompleteDTO();
				rentalCompleteDTO.setUser_id(principal.getName());
				log.info(rentalCompleteDTO);
				RentalCompleteDTO rentalDTO = rentalService.getRentalComplete(rentalCompleteDTO);
				model.addAttribute("rentalDTO",rentalDTO);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return "rental.rental";
	}
	
}