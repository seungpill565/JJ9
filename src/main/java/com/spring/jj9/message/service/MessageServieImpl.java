package com.spring.jj9.message.service;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Message;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.message.mapper.MessageMapper;

@Service
public class MessageServieImpl implements MessageService{
	@Autowired
	MessageMapper mapper;

	

	@Override
	public TalentAll getMemberId(int id) {

		return mapper.getId(id);
	}



	@Override
	public Integer insertMessage(Message message) {
		return mapper.insertMessage(message);
	}

}
