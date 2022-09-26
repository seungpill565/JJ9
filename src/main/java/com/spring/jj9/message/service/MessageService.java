package com.spring.jj9.message.service;

import com.spring.jj9.dto.Message;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.dto.Talent_request_all;

public interface MessageService {
	
	public TalentAll getMemberId(int id);
	
	public Integer insertMessage(Message message);
	
	public Talent_request_all getMemberId2(int id);
}