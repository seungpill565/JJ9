package com.spring.jj9.note.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Message;
import com.spring.jj9.note.mapper.NoteMapper;

@Service
public class NoteServiceImpl implements NoteService{
	
	@Autowired
	NoteMapper mapper;

	@Override
	public List<Message> getSender(String id) {
		return mapper.getSender(id);
	}

	@Override
	public List<Message> getResiver(String id) {
		return mapper.getResiver(id);
	}
	
	

}
