package com.hmall.team04.service.cs;

import java.util.List;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.cs.NoticeDTO;
import com.hmall.team04.dto.cs.QnaDTO;

public interface QnaService {

	void insertQna(QnaDTO qnadto) throws Exception;

	int getBoardCount(String userid, Criteria cri) throws Exception;

	List<QnaDTO> getQnaList(String userid, Criteria cri) throws Exception;

	List<QnaDTO> getQnaListFive(String userid) throws Exception;

}
