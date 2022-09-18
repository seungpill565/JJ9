package com.spring.jj9.admin.service;

import java.util.List;

import com.spring.jj9.dto.Notice;

public interface NoticeService {	
	
	public List<Notice> getNoticeList();

	public void updateNotice(Integer notice_id, Notice notice);

	

}
