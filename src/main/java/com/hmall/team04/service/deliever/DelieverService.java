package com.hmall.team04.service.deliever;

import java.util.List;

import com.hmall.team04.dto.deliever.DelieverDTO;

public interface DelieverService {
	
	// 배송지 리스트 조회
	List<DelieverDTO> selectDelieverListByUserId(String user_id) throws Exception;
	
	// 배송지 추가
	DelieverDTO insertDeliever(DelieverDTO delieverDTO) throws Exception;
	
	//배송지 수정
	void updateDeliever(DelieverDTO delieverDTO) throws Exception;
	
	//배송지 삭제
	void deleteDeliever(DelieverDTO delieverDTO) throws Exception;

	// 기본 배송지 (없으면 null)
	DelieverDTO selectDelieverActiveYnByUserId(String user_id) throws Exception;

}
