package com.spring.jj9.util;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class CategoryPageVO {
	
//	private int startPage; // 첫 페이지 번호
//	private int endPage;  // 마지막 페이지 번호
//	private boolean next; // 다음 버튼 활성화
//	private boolean prev; // 이전 버튼 활성화
//	
//	private int total; // 총 재능 등록 수
//	private int pageNum; // 현재 조회하고있는 페이지 번호
//	private int amount;  // 한 페이지에 보여지는 재능 개수
//
//	private Criteria cri;
//	
//	public CategoryPageVO(Criteria cri, int total) {
//		this.pageNum = cri.getPageNum();
//		this.amount = cri.getAmount();
//		this.total = total;
//		this.cri = cri;
//		
//		// math.ceil 소수점이 존재할때 값을 올림한다
//		this.endPage = (int)Math.ceil(this.pageNum / 10.0) * 10;
//		
//		this.startPage = this.endPage - 10 + 1;
//		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
//		
//		if(this.endPage > realEnd) {
//			this.endPage = realEnd;
//		}
//		
//		this.prev = this.startPage>1;
//		
//		this.next = this.endPage<realEnd;
//			
//	}
//	
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	private Criteria cri;
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public Criteria getCri() {
		return cri;
	}
	 
	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
	  
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
						    .queryParam("page", page)
							.queryParam("perPageNum", cri.getPerPageNum())
							.build();
		   
		return uriComponents.toUriString();
	}
	
	
}
