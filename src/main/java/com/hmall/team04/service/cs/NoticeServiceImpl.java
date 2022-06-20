package com.hmall.team04.service.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.hmall.team04.dao.cs.NoticeDAO;
import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.cs.NoticeDTO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NoticeServiceImpl implements NoticeService {
	
	private NoticeDAO noticeDAO;

//	@Value("${pageSize}")
//	private int pageSize;

	public NoticeServiceImpl(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	@Override
	public List<NoticeDTO> getNoticeList(Criteria cri) throws Exception {
		return noticeDAO.getNoticeList(cri);
	}

	@Override
	public NoticeDTO getNoticeArticle(String articleid) throws Exception {
		return noticeDAO.getNoticeArticle(articleid);
	}

	@Override
	public List<NoticeDTO> getNoticeListFive() throws Exception {
		
		return noticeDAO.getNoticeListFive();
	}

	@Override
	public int getBoardCount(Criteria cri) throws Exception {
		
		return noticeDAO.getBoardCount(cri);
	}
	
}
