package com.spring.jj9.note.mapper;

import java.util.List;

import com.spring.jj9.dto.Message;

public interface NoteMapper {
	
	public List<Message> getSender(String id);
	public List<Message> getResiver(String id);

}
