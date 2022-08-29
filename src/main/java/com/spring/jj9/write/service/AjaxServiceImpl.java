package com.spring.jj9.write.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Pizza;
import com.spring.jj9.write.mapper.PizzaMapper;

@Service
public class AjaxServiceImpl implements AjaxService {
	
	@Autowired
	PizzaMapper pizzaMapper;
	
	
	@Override
	public List<Pizza> getPizzaList() {
		
		return pizzaMapper.getList();
	}
}
