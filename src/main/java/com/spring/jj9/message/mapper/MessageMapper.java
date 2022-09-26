package com.spring.jj9.message.mapper;

import com.spring.jj9.dto.Message;
import com.spring.jj9.dto.TalentAll;
import com.spring.jj9.dto.Talent_request_all;

public interface MessageMapper {
	
	public TalentAll getId(int pk);
	public Integer insertMessage(Message message);
	public Talent_request_all getId2(int pk);

}
