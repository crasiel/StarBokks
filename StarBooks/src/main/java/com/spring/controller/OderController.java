package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OderController {

	@GetMapping("/cash")
	public void cash() {}
	
	@GetMapping("/history")
	public void history() {}
	
	@GetMapping("/point")
	public void point() {}
	
	@GetMapping("/coupon")
	public void coupon() {}
	
	@GetMapping("/cart")
	public void cart() {
	}
}
