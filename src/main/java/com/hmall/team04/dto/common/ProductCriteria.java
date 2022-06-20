package com.hmall.team04.dto.common;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class ProductCriteria {
	private int pageNum;
	private int amount;
	
	private String categoryCode;
	
	// 검색처리
	private String keyword;
	
	public ProductCriteria() {
		this.pageNum = 1;
		this.amount = 15;
	}
	
	public ProductCriteria(String categoryCode) {
		this.pageNum = 1;
		this.amount = 15;
		this.categoryCode = categoryCode;
	}
	
	public ProductCriteria(int pageNum, String keyword) {
		this.pageNum = pageNum;
		this.amount = 15;
		this.keyword = keyword;
	}
	
	
	public ProductCriteria(int pageNum, int amount, String categoryCode) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.categoryCode = categoryCode;
	}
	
	public ProductCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getCategoryCode())
				.queryParam("keyword", this.getKeyword());
	
		return builder.toUriString();
	}

}
