package com.hmall.team04.dto.deliever;

import lombok.Data;

@Data
public class DelieverDTO {
	
	private String deliever_id;
	private String user_id;
	private String address_f; 		//우편번호
	private String address_l; 		//상세주소
	private String deliever_hp_no;  //휴대폰 번호
	private String receiver_nm;   	//받으실분 이름
	private char active_yn; 		//기본 배송지 여부
	
}
