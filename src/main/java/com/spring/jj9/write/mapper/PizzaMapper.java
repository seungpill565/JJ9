package com.spring.jj9.write.mapper;

import java.util.List;

import com.spring.jj9.dto.Pizza;

public interface PizzaMapper {
	
	public List<Pizza> getList();
	
	public Pizza getPizza(int pk);
	
	public Integer updateView(int pk);
	
	public void deletePizza(Integer id);
	
	public Integer createPizza(Pizza pizza);
	
	public Integer updatePizza(Pizza pizza);
}
