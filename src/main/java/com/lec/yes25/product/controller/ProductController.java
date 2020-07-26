package com.lec.yes25.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "/products", method = RequestMethod.GET)
@Controller
public class ProductController {
	
	@RequestMapping(value="/list")
	public String list() {
		return "/products/bookList";
	}
	@RequestMapping(value="/form")
	public String form() {
		return "/products/formAction";
	}

}
