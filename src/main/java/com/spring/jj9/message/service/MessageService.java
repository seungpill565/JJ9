package com.spring.jj9.message.service;

import com.spring.jj9.dto.Message;
import com.spring.jj9.dto.TalentAll;

public interface MessageService {
	
	public TalentAll getMemberId(int id);
	
	public Integer insertMessage(Message message);
}
