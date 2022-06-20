package com.hmall.team04.service.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmall.team04.dao.like.LikeDAO;
import com.hmall.team04.dto.like.LikeDTO;

import lombok.Setter;

@Service
public class LikeServiceImpl implements LikeService {

	@Setter(onMethod_ = { @Autowired })
	private LikeDAO likeDAO;

	@Override
	public int getLikeCnt(String prd_board_id) throws Exception {
		// TODO Auto-generated method stub
		return likeDAO.getLikeCnt(prd_board_id);
	}

	@Override
	public void InsertLike(LikeDTO likeDTO) throws Exception {
		// TODO Auto-generated method stub
		likeDAO.InsertLike(likeDTO);
	}

	@Override
	public int likeIsExist(LikeDTO likeDTO) throws Exception {
		// TODO Auto-generated method stub
		return likeDAO.likeIsExist(likeDTO);
	}

	@Override
	public void DeleteLike(LikeDTO likeDTO) throws Exception {
		// TODO Auto-generated method stub
		likeDAO.DeleteLike(likeDTO);
	}



}
