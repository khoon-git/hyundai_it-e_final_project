package com.hmall.team04.dto.rental;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class RentalCriteria {
	private int pageNum;
	private int amount;
	
	private String category;
	
	// 검색처리
	private String keyword;
	
	public RentalCriteria() {
		this.pageNum = 1;
		this.amount = 9;
	}
	
	public RentalCriteria(String category) {
		this.pageNum = 1;
		this.amount = 6;
		this.category = category;
		this.keyword = "";
	}
	
	public RentalCriteria(int pageNum, String categoryCode, String keyword) {
		this.pageNum = pageNum;
		this.amount = 27;
		this.category = categoryCode;
		this.keyword = keyword;
	}
	
	
	public RentalCriteria(int pageNum, int amount, String categoryCode) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.category = categoryCode;
		this.keyword = "";
	}
	
	public RentalCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
