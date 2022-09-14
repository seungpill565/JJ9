package com.spring.jj9.util;

import lombok.Data;

@Data
public class PageMake {
	
	  /* 시작 페이지 */
    private int startPage; // 1  11 21 31 ...
    
    /* 끝 페이지 */
    private int endPage; //10 20 30 ...
    
    /* 이전 페이지, 다음 페이지 존재유무 */
    private boolean prev, next;
    
    /*전체 게시물 수*/
    private int total;
    
    /* 현재 페이지, 페이지당 게시물 표시수 정보 */
    private Criteria cri;
 
    public PageMake(Criteria cri, int total) {
        
        this.cri = cri;
        this.total = total;
        
        /* 마지막 페이지 */  // ex) 현재페이지 14 -> 14/10 = 1 -> 1*10 = 20 -> 20이 마지막 페이지 
        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10; //Math.ceil : 올림처리한다 
        
        /* 시작 페이지 */   // 끝 번호가 구해지면 거기서 9만 빼면 된다
        this.startPage = this.endPage - 9;
        
        /* 전체 마지막 페이지 */  // 1.0 은 int / int를 할 경우 소수점이 나와도 정수부분만 리턴하기 때문에 소수점을 구하기 위해 곱해준다
        int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));  // ex) 총 재능 개수 : 331 -> 331/10 = 33 -> 34 
        
        /* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
        if(realEnd < this.endPage) { //ex) endPage=20 realEnd=16
            this.endPage = realEnd;
        }
        
        /* 시작 페이지(startPage)값이 1보다 큰 경우 true */
        this.prev = this.startPage > 1;
        
        /* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
        this.next = this.endPage < realEnd;
        
        
    }
    
    
}
