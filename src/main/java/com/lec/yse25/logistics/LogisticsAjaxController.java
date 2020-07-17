package com.lec.yse25.logistics;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/logistics/*.ajax")
public class LogisticsAjaxController {
	
	@RequestMapping("/logistics/inventory.ajax")
	public AjaxWriteList inventory(HttpServletRequest request, HttpServletResponse response) {
		// TODO
		
		return null;
	}
}
