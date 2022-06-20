package com.hmall.team04.dao.deliever;

import java.util.List;

import com.hmall.team04.dto.deliever.DelieverDTO;

public interface DelieverDAO {

	List<DelieverDTO> selectDelieverListByUserId(String user_id) throws Exception;

	DelieverDTO insertDeliever(DelieverDTO delieverDTO) throws Exception;

	Integer updateDeliever(DelieverDTO delieverDTO) throws Exception;

	Integer deleteDeliever(DelieverDTO delieverDTO) throws Exception;

	DelieverDTO selectDelieverActiveYnByUserId(String user_id) throws Exception;

	void resetActiveYnByUserId(String user_id) throws Exception;
	
}
