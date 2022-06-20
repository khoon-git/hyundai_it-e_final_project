package com.hmall.team04.dao.coupon;

import java.util.List;

import com.hmall.team04.dto.coupon.CouponDTO;
import com.hmall.team04.dto.coupon.CouponDataDTO;

public interface CouponDAO {

	int getCouponCountbyUserId(String user_id) throws Exception;

	List<CouponDTO> selectCouponListByUserId(String user_id) throws Exception;

	CouponDTO selectCouponTop1ByUserId(String user_id) throws Exception;
	
	void deleteCoupon(CouponDataDTO couponDataDTO) throws Exception;
}
