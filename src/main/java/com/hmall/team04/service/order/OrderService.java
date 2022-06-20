package com.hmall.team04.service.order;

import java.util.ArrayList;
import java.util.List;

import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderDetailDTO;

public interface OrderService {
	//
	ArrayList<OrderCompleteDTO> getOrderCompleteList(OrderCompleteDTO ordercompleteDTO) throws Exception;

	OrderCompleteDTO getPrdPayment(OrderCompleteDTO ordercompleteDTO) throws Exception;

	OrderDTO getOrderByOrderNo(String userid, String orderNo) throws Exception;

	OrderDetailDTO getOrderDetail(String userid, String orderDetailNo) throws Exception;

	void updateCancelInfo(int updtTotal, int updtDis, int updtPmt, int updtRDA, int updtCDA, int updtPC, int updtBDA, String updtFlag, String orderId, String oDetailId, String userId) throws Exception;

	void insertSuccessOrder(List<OrderCompleteDTO> orderCompleteList) throws Exception;

}
