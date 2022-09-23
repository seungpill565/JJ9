package com.spring.jj9.note.service;

import java.util.List;

import com.spring.jj9.dto.Message;

public interface NoteService {
	
	public List<Message> getSender(String id);
	public List<Message> getResiver(String id);

}
