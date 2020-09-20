
package com.vanda.controller;



import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vanda.domain.HospitalVO;
import com.vanda.domain.UserVO;
import com.vanda.service.ChatService;
import com.vanda.service.FoodService;
import com.vanda.service.KindService;
import com.vanda.service.PetService;
import com.vanda.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	UserService service;
	@Autowired
	private KindService kindService;
	
	@Autowired
	private FoodService	foodService;
	
   @Autowired
   private UserService userService;
   @Autowired
   private PetService petService;
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
	public String mypage(HttpSession session) {
		//로그인한유저가 등록된 병원 있으면 1 없으면 0
		
		UserVO loginUser = (UserVO) session.getAttribute("check");
		 System.out.println("펫등록 화면");
			if (loginUser == null) {
				System.out.println("로그인된 유저 없음 로그인화면 이동");

				return "redirect:/user/login";
			} else {
				//견종 세션 및 견종에 해당하는 사료종류세션
				session.setAttribute("kindList", kindService.kindList()); 
				session.setAttribute("defaultFood", kindService.foodList(1));
				System.out.println("펫종류 및 사료등록화면"+kindService.kindList());
				
		
		if(loginUser.getUser_rule().equals("doctor")) {
			
			
			int hospChk = service.hospChk(loginUser.getUser_id());
			
			//doctor테이블에 등록된 유저의 경우 -> 병원 수정
			if(hospChk==1) {
				HospitalVO hosp = service.selHosp(loginUser.getUser_id());
				session.setAttribute("hosp", hosp);
			}else {
				//doctor테이블에 등록되지않은 회원 -> 병원 등록 및 doctor테이블에 insert
				session.setAttribute("hosp", null);
				
			}
			
			return "/myPage/myPage";
			
			}
			return "/myPage/myPage";
		
			}
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