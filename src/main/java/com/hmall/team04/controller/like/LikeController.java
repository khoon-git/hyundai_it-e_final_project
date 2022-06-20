package com.hmall.team04.controller.like;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.cart.CartDTO;
import com.hmall.team04.dto.like.LikeDTO;
import com.hmall.team04.service.like.LikeService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class LikeController {
	
	@Autowired
	private LikeService likeService;
	
	@RequestMapping(value = "/insertLike", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, Integer> Like(LikeDTO likeDTO, Principal principal) throws Exception {
		
		log.info(likeDTO.toString());

		// jsp에서 sec 태그를 통해 로그인 여부 확인해줌
		// 즉, 언제나 로그인 유효성을 통과한 다음에야 이 컨트롤러에 도달
		log.info(principal.getName());
		likeDTO.setUser_id(principal.getName());
		log.info(likeDTO);
		likeService.InsertLike(likeDTO);
		int LikeIsExist=likeService.likeIsExist(likeDTO);
		int LikeCnt=likeService.getLikeCnt(likeDTO.getPrd_board_id());
		
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("LikeIsExist", (Integer)LikeIsExist);
		map.put("LikeCnt", (Integer)LikeCnt);
		
		return map;	
	}
	
	@RequestMapping(value = "/deleteLike", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, Integer> deletePrdCartId(LikeDTO likeDTO, Principal principal) throws Exception {
		
		// 언제나 로그인 이후에만 이 컨트롤러로 다가옴
		likeDTO.setUser_id(principal.getName());
		log.info(likeDTO);
		likeService.DeleteLike(likeDTO);
		
		int LikeIsExist=likeService.likeIsExist(likeDTO);
		int LikeCnt=likeService.getLikeCnt(likeDTO.getPrd_board_id());
		
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("LikeIsExist", (Integer)LikeIsExist);
		map.put("LikeCnt", (Integer)LikeCnt);
		
		return map;
	}		
}