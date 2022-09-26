package com.spring.jj9.admin.service;

import java.util.List;

import com.spring.jj9.dto.Notice;

public interface NoticeService {	
	
	public List<Notice> getNoticeList1();
	
	public List<Notice> getNoticeList2();
	
	public List<Notice> getNoticeList3();

	public void updateNotice(Integer notice_id, Notice notice);

	public void newNotice(Notice notice);

	public void deleteNotice(Integer notice_id);

	public Integer getNoticeCount();

	public Notice getNoticeById(Integer id);

	

}
