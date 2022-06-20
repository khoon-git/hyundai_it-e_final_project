package com.hmall.team04.service.deliever;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hmall.team04.dao.deliever.DelieverDAO;
import com.hmall.team04.dto.deliever.DelieverDTO;
import com.hmall.team04.util.PhoneNumberUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class DelieverServiceImpl implements DelieverService {
	
	private final DelieverDAO delieverDAO;
	private final PhoneNumberUtil phoneNumberUtil;
	
	// 배송지 리스트 조회
	@Override
	public List<DelieverDTO> selectDelieverListByUserId(String user_id) throws Exception {
		
		List<DelieverDTO> delieverList = delieverDAO.selectDelieverListByUserId(user_id);
		for(DelieverDTO dto : delieverList) {
			dto.setDeliever_hp_no(phoneNumberUtil.phoneNumberHyphenAdd(dto.getDeliever_hp_no(), "N"));
		}
		
		return delieverList;
	}
	
	// 배송지 추가
	@Transactional
	@Override
	public DelieverDTO insertDeliever(DelieverDTO delieverDTO) throws Exception {
		// delieverDTO의 active_yn이 1이면 user_id에 해당하는 active_yn 전부다 0으로 바꾼다음에 수정시켜줌
		//기본배송지로 새로 선택했을경우 기존 기본 배송지는 0으로 바꿔줘야함
		if (delieverDTO.getActive_yn() == '1') {
			delieverDAO.resetActiveYnByUserId(delieverDTO.getUser_id());
		}
		
		return delieverDAO.insertDeliever(delieverDTO);
	}
	
	// 배송지 수정
	@Transactional
	@Override
	public void updateDeliever(DelieverDTO delieverDTO) throws Exception{
		// delieverDTO의 active_yn이 1이면 user_id에 해당하는 active_yn 전부다 0으로 바꾼다음에 수정시켜줌
		
		//기본배송지로 새로 선택했을경우 기존 기본 배송지는 0으로 바꿔줘야함
		if (delieverDTO.getActive_yn() == '1') {
			delieverDAO.resetActiveYnByUserId(delieverDTO.getUser_id());
		}
		
		delieverDAO.updateDeliever(delieverDTO);
	}
	
	// 배송지 삭제
	@Transactional
	@Override
	public void deleteDeliever(DelieverDTO delieverDTO) throws Exception {
		
		delieverDAO.deleteDeliever(delieverDTO);
		
	}
	//기본배송지 조회
	@Override
	public DelieverDTO selectDelieverActiveYnByUserId(String user_id) throws Exception {
		DelieverDTO delieverDTO = delieverDAO.selectDelieverActiveYnByUserId(user_id);
		
		//기본 배송지가 있는경우
		if (delieverDTO != null) {
			delieverDTO.setDeliever_hp_no(phoneNumberUtil.phoneNumberHyphenAdd(delieverDTO.getDeliever_hp_no(), "N"));
		}
		
		return delieverDTO;
	}

}
