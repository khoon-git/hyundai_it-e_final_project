package com.hmall.team04.controller.coupon;

import java.security.Principal;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hmall.team04.dto.coupon.CouponDTO;
import com.hmall.team04.service.coupon.CouponService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/coupon")
public class CouponController {
	
	private final CouponService couponService;
	
	@GetMapping("/selectCouponList")
	public List<CouponDTO> selectCouponList(Principal principal) {
		String user_id = principal.getName();
		
		// 유저별 쿠폰 리스트 조회해오기
		List<CouponDTO> couponList = null;
		try {
			couponList = couponService.selectCouponListByUserId(user_id);
			log.info(couponList.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return couponList;
	}
	
	
	
}
