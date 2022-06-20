package com.hmall.team04.dao.like;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hmall.team04.dto.common.Criteria;
import com.hmall.team04.dto.like.LikeDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.dto.review.ReviewDTO;

public interface LikeDAO {

	// 상품 게시판 관련 댓글들
	int getLikeCnt(String prd_board_id) throws SQLException;

	void InsertLike(LikeDTO likeDTO) throws SQLException;

	int likeIsExist(LikeDTO likeDTO) throws SQLException;

	void DeleteLike(LikeDTO likeDTO) throws SQLException;

}
