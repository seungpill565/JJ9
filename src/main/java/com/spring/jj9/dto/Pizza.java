package com.spring.jj9.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// Mybatis를 이용해 CRUD를 구현해보세요

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Pizza {
	private Integer id;
	private String name;
	private Integer price;
	private Double calories;
}
