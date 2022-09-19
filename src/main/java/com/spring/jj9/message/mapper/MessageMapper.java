package com.spring.jj9.message.mapper;

import com.spring.jj9.dto.Message;
import com.spring.jj9.dto.TalentAll;

public interface MessageMapper {
	
	public TalentAll getId(int pk);
	public Integer insertMessage(Message message);

}
