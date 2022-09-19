package com.spring.jj9.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Faq;
import com.spring.jj9.dto.Notice;
import com.spring.jj9.mapper.FaqMapper;
import com.spring.jj9.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeMapper mapper;

	@Override
	public List<Notice> getNoticeList() {		
		return mapper.getNoticeList();
	}

	@Override
	public void updateNotice(Integer notice_id, Notice notice) {
		mapper.updateNotice(notice_id, notice.getNotice_title(), notice.getNotice_content(), notice.getNotice_date(), notice.getNotice_importance());
		
	}

	


}
