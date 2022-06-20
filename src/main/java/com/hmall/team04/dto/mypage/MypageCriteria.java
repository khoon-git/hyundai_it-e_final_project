package com.hmall.team04.dto.mypage;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MypageCriteria {

		private int pageNum;
		private int amount;		
		private String keyword;
		private String ordStrtDt;
		private String ordEndDt;
		private String id;
		
		public MypageCriteria() {
			this.pageNum = 1;
			this.amount = 10;
			this.keyword = "";
			this.ordStrtDt = "00000000";
			this.ordEndDt = "99999999";
		}
		
		public MypageCriteria(int pageNum, int amount) {
			this.pageNum = pageNum;
			this.amount = amount;
		}
		
		public MypageCriteria(String ordStrtDt, String ordEndDt,int pageNum, int amount,String keyword, String id) {
			this.ordStrtDt = ordStrtDt;
			this.ordEndDt = ordEndDt;
			this.pageNum = pageNum;
			this.amount = amount;			
			this.keyword = keyword;
			this.id = id;
		}
		
}

