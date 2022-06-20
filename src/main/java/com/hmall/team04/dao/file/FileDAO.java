package com.hmall.team04.dao.file;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.common.ProductCriteria;
import com.hmall.team04.dto.common.ReviewCriteria;
import com.hmall.team04.dto.file.FileDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

public interface FileDAO {

	// 댓글 관련 파일 Read
	ArrayList<FileDTO> getReviewFileList(FileDTO fileDTO) throws SQLException;

	// 댓글 관련 파일 insert
	void insertReviewFile(FileDTO fileDTO) throws SQLException;

	void deleteReviewfile(FileDTO fileDTO) throws SQLException;
	
}
