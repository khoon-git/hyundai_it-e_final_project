package com.hmall.team04.dto.mypage;



import lombok.Data;

@Data
public class MypagePageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private MypageCriteria cri;
	private int realEnd;
	public MypagePageDTO(MypageCriteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum()/10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		this.realEnd = (int) (Math.ceil((total*1.0) / cri.getAmount()));
		
		if (this.realEnd < this.endPage) {
			this.endPage = this.realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
 	}

}
