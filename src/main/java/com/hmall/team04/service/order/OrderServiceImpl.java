package com.hmall.team04.service.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hmall.team04.controller.cart.CartController;
import com.hmall.team04.dao.cart.CartDAO;
import com.hmall.team04.dao.coupon.CouponDAO;
import com.hmall.team04.dao.order.OrderDAO;
import com.hmall.team04.dao.product.ProductBoardDAO;
import com.hmall.team04.dto.cart.CartDTO;
import com.hmall.team04.dto.coupon.CouponDataDTO;
import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderDetailDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderServiceImpl implements OrderService {
	
	
	@Setter(onMethod_ = { @Autowired })
	private OrderDAO orderDAO;
	
	@Setter(onMethod_ = { @Autowired })
	private CouponDAO couponDAO;

	@Override
	public ArrayList<OrderCompleteDTO> getOrderCompleteList(OrderCompleteDTO ordercompleteDTO) throws Exception {
		// TODO Auto-generated method stub
		return orderDAO.getOrderCompleteList(ordercompleteDTO);
	}

	@Override
	public OrderCompleteDTO getPrdPayment(OrderCompleteDTO ordercompleteDTO) throws Exception {
		// TODO Auto-generated method stub
		return orderDAO.getPrdPayment(ordercompleteDTO);
	}

	@Override
	public OrderDTO getOrderByOrderNo(String userid, String orderNo) throws Exception {
		return orderDAO.getOrderByOrderNo(userid, orderNo);
	}

	@Override
	public OrderDetailDTO getOrderDetail(String userid, String orderDetailNo) throws Exception {
		return orderDAO.getOrderDetail(userid, orderDetailNo);
	}

	@Override
	@Transactional
	public void updateCancelInfo(int updtTotal, int updtDis, int updtPmt, int updtRDA, int updtCDA, int updtPC, int updtBDA, String updtFlag, String orderId, String oDetailId, String userId)
			throws Exception {
		orderDAO.cancelOrder(updtTotal, updtDis, updtPmt, updtRDA, updtCDA, updtBDA, orderId, userId);
		orderDAO.cancelOrderDetail(updtPC, updtFlag, oDetailId, userId);
	}

	@Transactional
	@Override
	public void insertSuccessOrder(List<OrderCompleteDTO> orderCompleteList) throws Exception {
		
		
		orderDAO.insertOrderAndPayment(orderCompleteList.get(0)); // 주문, 결제내역 insert
		
		if ( orderCompleteList.get(0).getCoupon_id() != null && !orderCompleteList.get(0).getCoupon_id().isEmpty() ) { //쿠폰을 사용했다면
			couponDAO.deleteCoupon(new CouponDataDTO(orderCompleteList.get(0).getUser_id(), orderCompleteList.get(0).getCoupon_id())); //해당 쿠폰 삭제
		}
		
		for (OrderCompleteDTO orderCompleteDTO : orderCompleteList) {
			orderDAO.insertOrderDetail(orderCompleteDTO);
		}
		
		
	}

}
