package com.hmall.team04.dao.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hmall.team04.dto.mypage.MypageCriteria;
import com.hmall.team04.dto.mypage.MypageDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderDetailDTO;

import com.hmall.team04.dto.rental.RentalUserDTO;
import com.hmall.team04.dto.rental.RentalOrderDTO;


public interface MypageDAO {
	
	/* 마이페이지 최근 14일간 주문한 내역 */
	List<OrderDTO> getPurchasePrd(@Param("id") String id, @Param("day") int day) throws Exception;

	/*마이페이지 팝업(반품)*/
	List<OrderDetailDTO> getPopupDetailbyOrderDetailId(String detailid) throws Exception;

	void updateflagR(OrderDetailDTO orderdetaildto) throws Exception;

	int getCountStep1(String id) throws Exception;
	
	int getCountStep2(String id) throws Exception;
	
	int getCountStep3(String id) throws Exception;
	
	int getCountStep4(String id) throws Exception;
	
	int getCountStep5(String id) throws Exception;

	List<OrderDTO> getPurchasePrdFlag(MypageCriteria mypageCriteria) throws Exception;
	
	List<OrderDTO> getPurchasePrdFlagByDate(MypageCriteria mypageCriteria) throws Exception;

	int getPurchasePrdFlagByDateTotalCount(MypageCriteria mypageCriteria) throws Exception;

	int getPurchasePrdFlagCount(MypageCriteria mypageCri) throws Exception;

	int getCountCstep(String id) throws Exception;

	int getCountRstep1(String id) throws Exception;

	int getCountRstep2(String id) throws Exception;

	int getCountEstep1(String id) throws Exception;

	int getCountEstep2(String id) throws Exception; 

	List<OrderDTO> getCrePrdFlag(MypageCriteria mypageCri) throws Exception;

	int getCrePrdFlagCount(MypageCriteria mypageCri) throws Exception;

	int getCrePrdFlagByDateTotalCount(MypageCriteria mypageCri) throws Exception;
	
	List<OrderDTO> getCrePrdFlagByDate(MypageCriteria mypageCri) throws Exception;

	String checkUserEmailYn(@Param("userid") String userid, @Param("email") String email) throws Exception;


	List<RentalUserDTO> getRentalList(@Param("id") String id, @Param("keyword") String keyword) throws Exception;   

	List<RentalOrderDTO> getRentalCompPrdByDate(MypageCriteria mypageCriteria) throws Exception;

	int getRentalCompPrdCountByDate(MypageCriteria mypageCri) throws Exception;  
	
	int getUserGrade(String userid) throws Exception;

	RentalUserDTO getRentalProduct(String rentalorderNo) throws Exception;

	void rentalupdateFlagR(@Param("userid") String userid, @Param("prd_id") String prd_id) throws Exception; 


}
