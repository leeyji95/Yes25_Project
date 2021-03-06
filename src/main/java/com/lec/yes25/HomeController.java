package com.lec.yes25;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	@RequestMapping(value="/index") // /index 으로 요청이 오면
	public String indexxx() {		 // indexxx() 핸들러가 수행되고
		return "index"; // → /WEB-INF/views/index.jsp 를 리턴하여 response 되게 한다.
	}
	
	@RequestMapping(value="/template") 
	public String template() {		 
		return "template";
	}
	
	@RequestMapping(value="/nav") 
	public String nav() {		 
		return "nav";
	}
	@RequestMapping(value="/left") 
	public String left() {		 
		return "left_menu";
	}
<<<<<<< HEAD
=======
	@RequestMapping(value="/login") 
	public String login() {		 
		return "personnel/login";
	}
>>>>>>> branch 'master' of https://github.com/leeyji95/Yes25_Project.git
}
