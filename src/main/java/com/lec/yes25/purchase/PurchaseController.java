package com.lec.yes25.purchase;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/purchase")
public class PurchaseController {	
	@RequestMapping(value = "/vendor")
	public String show() {
		return "purchase/vendor";
	}
}
