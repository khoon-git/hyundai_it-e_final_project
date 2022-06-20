package com.hmall.team04.controller.order;

import java.security.Principal;
import java.util.ArrayList;
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


import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.coupon.CouponDTO;
import com.hmall.team04.dto.deliever.DelieverDTO;

import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderPrdRequestDTO;
import com.hmall.team04.dto.order.OrderPrdResponseDTO;
import com.hmall.team04.service.balance.BalanceService;
import com.hmall.team04.service.coupon.CouponService;
import com.hmall.team04.service.deliever.DelieverService;
import com.hmall.team04.service.order.OrderService;
import com.hmall.team04.service.product.ProductBoardService;
import com.hmall.team04.service.product.ProductService;
import com.hmall.team04.service.reserve.ReserveService;
import com.hmall.team04.service.user.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
public class OrderController {

	private final DelieverService delieverService;
	private final UserService userService;
	private final CouponService couponService;
	private final ReserveService reserveService;
	private final BalanceService balanceService;
	private final ProductService productService;
	private final OrderService orderService;
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/order", method = { RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> ordertest(@RequestBody List<OrderPrdRequestDTO> orderPrdList, HttpServletRequest req, HttpServletResponse res) throws Exception {

		
		// ArrayList 로 변환 완료
		log.info(orderPrdList.toString());
		
		// 컨트롤러 간 공용 임시저장소인 session 을 불러와, orderInfo라는 key에 orderList를 value로 저장
		HttpSession session = req.getSession();
		session.setAttribute("orderInfo", orderPrdList);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("orderSuccess", "True");

		return map;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(HttpServletRequest req, HttpServletResponse res, Model model, Principal principal) {
		String user_id = principal.getName();
		String user_nm = "";
    
		// ArrayList 자료형을 가짐
		// !!! 반드시 c:foreach 로 출력해야함 !!!
		HttpSession session = req.getSession();
		List<OrderPrdRequestDTO> orderPrdRequestList = new ArrayList<>();
		orderPrdRequestList = (ArrayList<OrderPrdRequestDTO>) session.getAttribute("orderInfo");

		log.info("================================"+orderPrdRequestList.toString());
		
		List<OrderPrdResponseDTO> orderPrdList = new ArrayList<>();
		DelieverDTO activeDeliever = null;
		CouponDTO top1Coupon = null;
		int user_reserve = 0;
		int user_balance = 0;
		try {
			
			for(OrderPrdRequestDTO dto : orderPrdRequestList) { //주문서에 들어갈 상품(리스트)
				OrderPrdResponseDTO orderPrd = productService.getOrderProductByPrdId(dto.getPrd_id());
				orderPrd.setPrd_count(dto.getPrd_count());
				orderPrd.setPrd_price(orderPrd.getPrd_price() * dto.getPrd_count());
				
				orderPrdList.add(orderPrd);
			}
			
			activeDeliever = delieverService.selectDelieverActiveYnByUserId(user_id);
			user_nm = userService.getUserNamebyUserId(user_id);
			top1Coupon = couponService.selectCouponTop1ByUserId(user_id);
			user_reserve = reserveService.getReservebyUserId(user_id);
			user_balance = balanceService.getBalancebyUserId(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("user_nm", user_nm);
		model.addAttribute("activeDeliever", activeDeliever);
		model.addAttribute("top1Coupon", top1Coupon);
		model.addAttribute("user_reserve", user_reserve);
		model.addAttribute("user_balance", user_balance);
		model.addAttribute("prd_board_id", orderPrdRequestList.get(0).getPrd_board_id());
		model.addAttribute("orderPrdList", orderPrdList);
		// 우선 사용 완료했으므로 삭제하여 혹시모를 용량문제 해소 => orderComplete 에서 삭제
		//session.removeAttribute("orderInfo");

		return "order.order";
	}
	
	
	
	
	@RequestMapping(value = "/orderComplete", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public void orderCompletePost(@RequestBody List<OrderCompleteDTO> orderCompleteList, Principal principal) {
			
		for(OrderCompleteDTO ordercompleteDTO : orderCompleteList) {
			log.info(ordercompleteDTO.toString());
		}
		
		try {
			orderService.insertSuccessOrder(orderCompleteList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/orderComplete", method = RequestMethod.GET)
	public String orderComplete(Principal principal,HttpServletRequest req, HttpServletResponse res, Model model) {
		HttpSession session = req.getSession();
		session.removeAttribute("orderInfo");
		
		String user_id;
		
		if(principal==null) {
			return "user.login.login";
		} else {
			user_id = principal.getName();
			
			try {
			OrderCompleteDTO ordercompleteDTO = new OrderCompleteDTO();
			ordercompleteDTO.setUser_id(user_id);
			ArrayList<OrderCompleteDTO> ordercompleteList = orderService.getOrderCompleteList(ordercompleteDTO);
			
			for(OrderCompleteDTO dto : ordercompleteList) {
				log.info(dto);
			}
			
			// prd_order_id
			String prd_order_id = ordercompleteList.get(0).getPrd_order_id();
			// check cnt of orderdetail
			int cnt_prd = ordercompleteList.size();
			
			// representative prd_id and check cnt of kind of item
			String prd_board_id = ordercompleteList.get(0).getPrd_board_id();
			String address_dest = ordercompleteList.get(0).getAddress_dest();
			String recipient = ordercompleteList.get(0).getRecipient();
			String hp_no = ordercompleteList.get(0).getHp_no();
			
			int total_amount = ordercompleteList.get(0).getTotal_amount();
			int pmt_amount = ordercompleteList.get(0).getPmt_amount();

			String pay_method = ordercompleteList.get(0).getPay_method();
			String bank_name = ordercompleteList.get(0).getVbank_name();
			String bank_num = ordercompleteList.get(0).getVbank_num();
			
			
			model.addAttribute("prd_order_id", prd_order_id);
			model.addAttribute("prd_board_id", prd_board_id);
			model.addAttribute("cnt_prd", cnt_prd);
			model.addAttribute("user_id", user_id);
			model.addAttribute("address_dest", address_dest);
			model.addAttribute("recipient", recipient);
			model.addAttribute("hp_no", hp_no);
			model.addAttribute("total_amount", total_amount);
			model.addAttribute("pay_method", pay_method);
			model.addAttribute("pmt_amount", pmt_amount);
			model.addAttribute("bank_name", bank_name);
			model.addAttribute("bank_num", bank_num);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}

		return "order.orderComplete";
	}
	
	@RequestMapping(value = "/orderPayComplete", method = { RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> orderPayComplete(OrderCompleteDTO ordercompleteDTO,Principal principal,HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 아임포트에서 ngrok을 통해 현재 localhost:8090/team04/orderPayComplete로 아래와 같이 전송
		//  curl -H "Content-Type: application/json" -X POST -d '{ "imp_uid": "imp_1234567890", "merchant_uid": "order_id_8237352", "status": "paid" }' { NotificationURL }
		log.info(ordercompleteDTO);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("orderPayComplete", "True");

		return map;
	}
	
	
	
}