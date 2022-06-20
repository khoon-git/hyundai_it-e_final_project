package com.hmall.team04.controller.cart;


import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmall.team04.dto.cart.CartDTO;
import com.hmall.team04.dto.deliever.DelieverDTO;
import com.hmall.team04.dto.order.OrderDTO;
import com.hmall.team04.dto.product.ProductBoardDTO;
import com.hmall.team04.service.cart.CartService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/basktList", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> carttest(@RequestBody List<CartDTO> cartList, Principal principal) throws Exception {
		for(CartDTO cartDTO : cartList) {
			cartDTO.setUser_id(principal.getName());
			log.info(cartDTO.toString());

			cartService.InsertPrdCart(cartDTO);
		}
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("cartSuccess", "True");
		
		return map;
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/basktList", method= RequestMethod.GET)
	public String cart(HttpServletRequest req,HttpServletResponse res, Model model, Principal principal) {
		
		HttpSession session=req.getSession();
		ArrayList<CartDTO> cartList;
		
		log.info(session.getAttribute("id"));
		log.info(principal.getName());
		
		try {
			cartList = cartService.getCartList(principal.getName());
			log.info(cartList.toString());
			
			model.addAttribute("cartList", cartList);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "cart.cart";
	}
	
	@RequestMapping(value = "/deletePrdCartId", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> deletePrdCartId(CartDTO cartDTO, HttpServletRequest req,HttpServletResponse res) throws Exception {
		
		log.info("deletePrdCartId "+cartDTO.toString());
		
		cartService.deletePrdCartId(cartDTO);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("delete_PrdCartId_Success", "True");
		
		return map;
	}	
	
	@RequestMapping(value = "/updatePrdCartQty", method= {RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, String> updatePrdCartQty(CartDTO cartDTO, HttpServletRequest req,HttpServletResponse res) throws Exception {
		
		log.info("updatePrdCartQty "+cartDTO.toString());
		
		cartService.updatePrdCartQty(cartDTO);
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("update_PrdCartQty_Success", "True");
		
		return map;
	}
}