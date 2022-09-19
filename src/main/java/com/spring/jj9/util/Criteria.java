package com.spring.jj9.util;

import java.util.List;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum; // 페이지 번호
	private int amount; // 1페이지 당 목록 표시 개수
	private String keyword; // 검색 시 파라미터로 받을 검색어
	private String type; // 제목, 내용, 작성자 별 검색 시 검색 할 타입
	private List<String> typeArr;
	
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
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public void setType(String type) { // type 변수에 검색어가 들어왔을때 자동으로 배열에 검색어들을 공백 단위로 저장한다.
		this.type = type;
		this.typeArr.add(type); 
	}

}
