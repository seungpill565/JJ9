package com.spring.jj9.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.jj9.dto.Notice;

public interface NoticeMapper {

	public List<Notice> getNoticeList1();	
	public List<Notice> getNoticeList2();	
	public List<Notice> getNoticeList3();	

	public void updateNotice(@Param("notice_id")Integer notice_id, 
			@Param("notice_title")String notice_title,
			@Param("notice_content")String notice_content, 
			@Param("notice_date")Date notice_date,
			@Param("notice_importance")String notice_importance);

	public void newNotice(Notice notice);

		
}
