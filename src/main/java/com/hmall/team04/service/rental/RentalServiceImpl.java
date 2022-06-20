package com.hmall.team04.service.rental;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmall.team04.dao.coupon.CouponDAO;
import com.hmall.team04.dao.rental.RentalDAO;
import com.hmall.team04.dto.coupon.CouponDataDTO;
import com.hmall.team04.dto.rental.RentalCompleteDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class RentalServiceImpl implements RentalService {
	
	
	@Setter(onMethod_ = { @Autowired })
	private RentalDAO rentalDAO;
	
	@Setter(onMethod_ = { @Autowired })
	private CouponDAO couponDAO;

	@Override
	public RentalCompleteDTO getRentalComplete(RentalCompleteDTO rentalcompleteDTO) throws Exception {
		// TODO Auto-generated method stub
		return rentalDAO.getRentalOrderComplete(rentalcompleteDTO);
	}

	@Override
	public void insertSuccessRentalOrder(RentalCompleteDTO rentalCompleteDTO) throws Exception {
		
		if ( rentalCompleteDTO.getCoupon_id() != null && !rentalCompleteDTO.getCoupon_id().isEmpty()) { //쿠폰을 사용했다면
			couponDAO.deleteCoupon(new CouponDataDTO(rentalCompleteDTO.getUser_id(), rentalCompleteDTO.getCoupon_id())); //해당 쿠폰 삭제
		}
		
		rentalDAO.insertSuccessRentalOrder(rentalCompleteDTO);
	}
	
	
}
