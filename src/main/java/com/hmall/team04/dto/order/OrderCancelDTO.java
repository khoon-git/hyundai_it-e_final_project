package com.hmall.team04.dto.order;

import lombok.Data;

@Data
public class OrderCancelDTO {
	private int updtTotal;
	private int updtDis;
	private int updtPmt;
	private int updtRDA;
	private int updtPC;
	private int updtBDA;
	private String updtFlag;
	private String orderId;
	private String oDetailId;
}
