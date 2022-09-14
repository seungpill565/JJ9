package com.spring.jj9.util;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class Criteria {
	
	private int pageNum; // 페이지 번호
	private int amount; // 1페이지 당 목록 표시 개수

	public Criteria() { // 매개변수로 아무것도 들어오지않으면 1페이지이므로 1, 10으로 초기화
		this(1, 12);
	}

	public Criteria(int pageNum, int amount) { 
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

}
