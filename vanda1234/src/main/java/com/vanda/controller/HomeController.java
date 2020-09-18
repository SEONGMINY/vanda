
package com.vanda.controller;



import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vanda.domain.UserVO;

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
	public String home() {
		
		return "home";
		
	}
	
	@RequestMapping(value = "/management2", method = RequestMethod.GET)
	public String management(HttpSession session) {		
		
		if(session.getAttribute("check")==null) {
	        return "/user/login2";
	    } else {
	        return "management2";
	    }
		
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(/* HttpSession session */) {		
		
		return "/pet/main";
		
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(/* HttpSession session */) {		
		
		return "/myPage/myPage";
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session) {
		
		if(session.getAttribute("check")==null) {
	        return "/user/login2";
	    } else {
	        return "management2";
	    }
	}
	

}