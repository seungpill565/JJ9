package com.spring.jj9.write.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jj9.dto.Pizza;
import com.spring.jj9.write.mapper.PizzaMapper;

@Service
public class PizzaServiceImpl implements PizzaService{
	
	/*
	 	# Mapper Interface
	 	
	 	 - 골격만 작성해놓으면 Mybatis가 자동으로 해당 인터페이스의 구현체를 생성한다
	 	 - 알아서 JDBC 코드를 자동으로 생성한 후 
	 	   mybatis-spring:scan을 통해 spring-context에 등록된다
	*/
	
	@Autowired
	PizzaMapper mapper;
	
	@Override
	public Pizza getPizza(int pk) {
		mapper.updateView(pk);
		return mapper.getPizza(pk);
	}
	
	@Override
	public List<Pizza> getList() {	
		return mapper.getList();
	}
	
	@Override
	public Integer updatePizza(Pizza pizza) {
		
		return mapper.updatePizza(pizza); 
	}
	
	@Override
	public Integer createPizza(Pizza pizza) {
		
		return mapper.createPizza(pizza);
	}
	
}
