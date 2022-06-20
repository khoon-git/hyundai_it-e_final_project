package com.hmall.team04.service.cs;

import java.util.List;

import com.hmall.team04.dto.cs.FaqDTO;

public interface FaqService {
	
	List<FaqDTO> getfaqList() throws Exception;
	
	List<FaqDTO> getfaqListFlag(String faq_flag) throws Exception;
	
	List<FaqDTO> getfaqListAll() throws Exception;
	
	List<FaqDTO> getfaqListFind(String keyword) throws Exception;

}
