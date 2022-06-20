package com.hmall.team04.service.cs;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hmall.team04.dao.cs.QnaDAO;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.cs.NoticeDTO;
import com.hmall.team04.dto.cs.QnaDTO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QnaServiceImpl implements QnaService {

	private QnaDAO qnaDAO;
	
	public QnaServiceImpl(QnaDAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}
	
	@Override
	public void insertQna(QnaDTO qnadto) throws Exception {
		qnaDAO.insertQna(qnadto);
	}

	@Override
	public int getBoardCount(String userid, Criteria cri) throws Exception {
		return qnaDAO.getBoardCount(userid, cri);
	}

	@Override
	public List<QnaDTO> getQnaList(String userid, Criteria cri) throws Exception {
		return qnaDAO.getQnaList(userid, cri);
	}
	
	@Override
	public List<QnaDTO> getQnaListFive(String userid) throws Exception {
		return qnaDAO.getQnaListFive(userid);
	}

	
	

}
