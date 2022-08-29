package com.spring.jj9.write;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.jj9.dto.Pizza;
import com.spring.jj9.write.mapper.PizzaMapper;
import com.spring.jj9.write.service.PizzaService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class PizzaRestController {
	
	@Autowired
	PizzaMapper mapper;
	
	@Autowired
	PizzaService service;
	
	// GET방식으로 피자의 ID와 함께 요청을 보내면 해당 피자의 정보를 JSON 형식으로 반환
	@GetMapping(value = "/sample/pizza/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public Pizza getPizza(@PathVariable("id") Integer id) {
		
		// 피자의 조회수(calories	)가 있다. 조회할 때마다 1씩 증가해야한다.
		return service.getPizza(id);
	}
	
	@GetMapping(value = "/sample/pizzaList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Pizza> getList() {
		
		List<Pizza> pizzas = service.getList();
		
		return pizzas;
	}
	
	// POST방식으로 파라미터의 피자 데이터와 함께 요청 보내면 해당 피자를 DB에 추가
	
	// @RestController에서는 @RequestBody를 적어주지 않으면 파라미터가 자동 바인딩 되지 않는다
	@PostMapping(value = "/sample/pizza")
	public ResponseEntity<Pizza> createPizza(@RequestBody Pizza pizza) {
		if (pizza.getName() == null || pizza.getName().trim().equals("") || 
				pizza.getCalories() == null || pizza.getPrice() == null) {
			return ResponseEntity.badRequest().build();
		}
		
		try {
			service.createPizza(pizza);
			
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.build();
		}
		// ResponseEntity: 상황에 따라 원하는 응답을 만들 수 있다. (상태 코드 활용)
		//ResponseEntity<Pizza> response = null;
		
		// ResponseEntity.ok() : Http 상태코드 200의 응답을 만든다.
		//response = ResponseEntity.ok(null);
		
		// ResponseEntity.notFound() : Http 상태코드 404의 응답을 만든다.
		//response = ResponseEntity.notFound().build();
		
		// 자유롭게 응답만들기
//		response = ResponseEntity.status(HttpStatus.OK)
//				.contentType(MediaType.APPLICATION_JSON)
//				.body(service.getPizza(3));
//		
//		return response;
	}
	
	// PUT방식으로 파라미터의 피자 데이터를 함께 요청 보내면 해당 피자의 정보를 수정
	@PutMapping(value = "/sample/pizza", produces = MediaType.TEXT_PLAIN_VALUE)
	public String updatePizza(@RequestBody Pizza pizza) {
		try {
			return service.updatePizza(pizza).toString();			
		} catch (Exception e) {
			return "0 : " + e;
		}
	}
	
	// DELETE 방식으로 피자의 ID와 함께 요청을 보내면 해당 피자를 DB에서 삭제
//	@DeleteMapping(value = "/smaple/pizza/{id}")
//	public String deletePizza(@PathVariable("id") Integer id){
//		
//		mapper.deletePizza(id);
//		
//		return "delete pizza id : " + id;
//	}
}
