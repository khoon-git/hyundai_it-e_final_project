package com.hmall.team04.service.mypage;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.mypage.MypageDAO;
import com.hmall.team04.dto.mypage.MypageCriteria;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderDetailDTO;

import com.hmall.team04.dto.rental.RentalUserDTO;

import com.hmall.team04.dto.rental.RentalOrderDTO;


import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MypageServiceImpl implements MypageService{
	
	private MypageDAO mypageDAO;
	
	public MypageServiceImpl(MypageDAO mypageDAO) {
		this.mypageDAO = mypageDAO;
	} 
	
	
	@Override
	public List<OrderDTO> getPurchasePrd(String id, int day) throws Exception{
	
		return mypageDAO.getPurchasePrd(id , day);
	}


	@Override
	public List<OrderDetailDTO> getPopupDetailbyOrderDetailId(String detailid) throws Exception {
		
		return mypageDAO.getPopupDetailbyOrderDetailId(detailid);
	}
	
	@Override
	public void updateflagR(OrderDetailDTO orderdetaildto) throws Exception{
		mypageDAO.updateflagR(orderdetaildto);
	}


	@Override
	public int getCountStep1(String id) throws Exception {
		
		return mypageDAO.getCountStep1(id);
	}


	@Override
	public int getCountStep2(String id) throws Exception {
		return mypageDAO.getCountStep2(id);
	}


	@Override
	public int getCountStep3(String id) throws Exception {
	
		return mypageDAO.getCountStep3(id);
	}


	@Override
	public int getCountStep4(String id) throws Exception {
		
		return mypageDAO.getCountStep4(id);
	}


	@Override
	public int getCountStep5(String id) throws Exception {
		
		return mypageDAO.getCountStep5(id);
	}


	@Override
	public List<OrderDTO> getPurchasePrdFlag(MypageCriteria mypageCriteria) throws Exception {
	
		return mypageDAO.getPurchasePrdFlag(mypageCriteria);
	}


	@Override
	public List<OrderDTO> getPurchasePrdFlagByDate(MypageCriteria mypageCriteria) throws Exception {
		
		return mypageDAO.getPurchasePrdFlagByDate(mypageCriteria);
	}


	@Override
	public int getPurchasePrdFlagByDateTotalCount(MypageCriteria mypageCriteria) throws Exception {
		
		return mypageDAO.getPurchasePrdFlagByDateTotalCount(mypageCriteria);
	}


	@Override
	public int getPurchasePrdFlagCount(MypageCriteria mypageCri) throws Exception {
	
		return mypageDAO.getPurchasePrdFlagCount(mypageCri);
	}


	@Override
	public int getCountCstep(String id) throws Exception {
		
		return mypageDAO.getCountCstep(id);
	}


	@Override
	public int getCountRstep1(String id) throws Exception {
		
		return mypageDAO.getCountRstep1(id);
	}


	@Override
	public int getCountRstep2(String id) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.getCountRstep2(id);
	}


	@Override
	public int getCountEstep1(String id) throws Exception {
	
		return mypageDAO.getCountEstep1(id);
	}


	@Override
	public int getCountEstep2(String id) throws Exception {
		
		return mypageDAO.getCountEstep2(id);
	}


	@Override
	public List<OrderDTO> getCrePrdFlag(MypageCriteria mypageCri) throws Exception {	
		return mypageDAO.getCrePrdFlag(mypageCri);
	}


	@Override
	public int getCrePrdFlagCount(MypageCriteria mypageCri) throws Exception {
		return mypageDAO.getCrePrdFlagCount(mypageCri);
	}


	@Override
	public int getCrePrdFlagByDateTotalCount(MypageCriteria mypageCri) throws Exception {
	
		return mypageDAO.getCrePrdFlagByDateTotalCount(mypageCri);
	}


	@Override
	public List<OrderDTO> getCrePrdFlagByDate(MypageCriteria mypageCri) throws Exception {
		
		return mypageDAO.getCrePrdFlagByDate(mypageCri);
	}
	
	@Override
	public String checkEmailDup(String userid, String email) throws Exception {
		return mypageDAO.checkUserEmailYn(userid, email);
	}



	@Override
	public List<RentalUserDTO> getRentalList(String id, String keyword) throws Exception {
		
		return mypageDAO.getRentalList(id,keyword);
	}
	



	@Override
	public List<RentalOrderDTO> getRentalCompPrdByDate(MypageCriteria mypageCriteria) throws Exception {
		return mypageDAO.getRentalCompPrdByDate(mypageCriteria);
	}


	@Override
	public int getRentalCompPrdCountByDate(MypageCriteria mypageCri) throws Exception {
		return mypageDAO.getRentalCompPrdCountByDate(mypageCri);
	}
	
	@Override
	public int getUserGrade(String userid) throws Exception {
		return mypageDAO.getUserGrade(userid);
	}


	@Override
	public RentalUserDTO getRentalProduct(String rentalorderNo) throws Exception {
		return mypageDAO.getRentalProduct(rentalorderNo);
	}


	@Override
	public void rentalupdateFlagR(String userid, String prd_id) throws Exception {
		mypageDAO.rentalupdateFlagR(userid, prd_id);
	}
}
