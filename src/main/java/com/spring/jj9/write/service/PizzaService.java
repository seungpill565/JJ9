package com.spring.jj9.write.service;

import java.util.List;

import com.spring.jj9.dto.Pizza;

public interface PizzaService {
	
	public Pizza getPizza(int pk);
	
	public List<Pizza> getList();
	
	public Integer updatePizza(Pizza pizza);
	
	public Integer createPizza(Pizza pizza);
	
}
