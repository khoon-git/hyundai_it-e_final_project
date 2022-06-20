package com.hmall.team04.dao.order;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hmall.team04.dto.order.OrderCompleteDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.order.OrderDetailDTO;

public interface OrderDAO {
	ArrayList<OrderCompleteDTO> getOrderCompleteList(OrderCompleteDTO ordercompleteDTO) throws SQLException;

	OrderCompleteDTO getPrdPayment(OrderCompleteDTO ordercompleteDTO) throws SQLException;

	OrderDTO getOrderByOrderNo(@Param("userId")String userId, @Param("orderNo")String orderNo) throws Exception;

	OrderDetailDTO getOrderDetail(@Param("userId") String userid, @Param("orderDetailNo") String orderDetailNo) throws Exception;

	void cancelOrder(@Param("updtTotal") int updtTotal, @Param("updtDis") int updtDis, @Param("updtPmt") int updtPmt, @Param("updtRDA") int updtRDA, @Param("updtCDA") int updtCDA,@Param("updtBDA") int updtBDA, @Param("orderId") String orderId, @Param("userId") String userId) throws Exception;

	void cancelOrderDetail(@Param("updtPC") int updtPC, @Param("updtFlag") String updtFlag, @Param("oDetailId") String oDetailId, @Param("userId") String userId) throws Exception;

	void insertOrderAndPayment(OrderCompleteDTO orderCompleteDTO) throws Exception;

	void insertOrderDetail(OrderCompleteDTO orderCompleteDTO) throws Exception;

}
