package com.hmall.team04.dao.cs;

import java.util.List;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.cs.NoticeDTO;

public interface NoticeDAO {
	
	List<NoticeDTO> getNoticeList(Criteria cri) throws Exception;

	NoticeDTO getNoticeArticle(String articleid) throws Exception;
	
	List<NoticeDTO> getNoticeListFive() throws Exception;

	int getBoardCount(Criteria cri) throws Exception;

}
