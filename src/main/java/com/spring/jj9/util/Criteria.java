package com.spring.jj9.util;

import java.util.List;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum; // �럹�씠吏� 踰덊샇
	private int amount; // 1�럹�씠吏� �떦 紐⑸줉 �몴�떆 媛쒖닔
	private String keyword; // 寃��깋 �떆 �뙆�씪誘명꽣濡� 諛쏆쓣 寃��깋�뼱
	private String type; // �젣紐�, �궡�슜, �옉�꽦�옄 蹂� 寃��깋 �떆 寃��깋 �븷 ���엯
	private List<String> typeArr;
	
	public Criteria() { // 留ㅺ컻蹂��닔濡� �븘臾닿쾬�룄 �뱾�뼱�삤吏��븡�쑝硫� 1�럹�씠吏��씠誘�濡� 1, 10�쑝濡� 珥덇린�솕
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
	
	public void setType(String type) { // type 蹂��닔�뿉 寃��깋�뼱媛� �뱾�뼱�솕�쓣�븣 �옄�룞�쑝濡� 諛곗뿴�뿉 寃��깋�뼱�뱾�쓣 怨듬갚 �떒�쐞濡� ���옣�븳�떎.
		this.type = type;
		this.typeArr.add(type); 
	}
}
