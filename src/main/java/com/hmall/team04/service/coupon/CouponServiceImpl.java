package com.hmall.team04.service.coupon;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.coupon.CouponDAO;
import com.hmall.team04.dto.coupon.CouponDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CouponServiceImpl implements CouponService{
	
	private CouponDAO couponDAO;
	
	public CouponServiceImpl(CouponDAO couponDAO) {
		this.couponDAO = couponDAO;
	}
	
	/* 마이페이지 보유쿠폰 */
	@Override
	public int getCouponCountbyUserId(String user_id) throws Exception {
		
		return couponDAO.getCouponCountbyUserId(user_id);
	}
	
	@Override
	public List<CouponDTO> selectCouponListByUserId(String user_id) throws Exception {

		return couponDAO.selectCouponListByUserId(user_id);
	}

	@Override
	public CouponDTO selectCouponTop1ByUserId(String user_id) throws Exception {

		return couponDAO.selectCouponTop1ByUserId(user_id);
	}
	
}
