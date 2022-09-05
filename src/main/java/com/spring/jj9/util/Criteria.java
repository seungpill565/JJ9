package com.spring.jj9.util;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class Criteria {
	
	//첫번째 페이징 코드
//	private int pageNum; // 페이지 번호
//	private int amount; // 1페이지 당 목록 표시 개수
//	
//	public Criteria() { // 매개변수로 아무것도 들어오지않으면 1페이지이므로 1, 10으로 초기화
//		this(1, 10);
//	}
//	
//	public Criteria(int pageNum, int amount) { 
//		this.pageNum = pageNum;
//		this.amount = amount;
//	}

	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}
}
