package com.vanda.controller;


import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.vanda.domain.ActivityVO;
import com.vanda.domain.UserVO;
import com.vanda.domain.WeightVO;
import com.vanda.service.ChartService;


@Controller
public class ChartController {
	@Autowired
	private ChartService service;
	

	int pet_num2;

	@RequestMapping(value = "chart", method = RequestMethod.GET)
	public String chart(Locale locale, Model model) {
		return "chart";
	}
	
	@ResponseBody
	@RequestMapping(value="getPetnum", method = RequestMethod.POST)
	public int getPetnum(int pet_num) {
		
	pet_num2=pet_num;
	System.out.println(pet_num+"펫넘");
	
	return pet_num;
	}

	@RequestMapping(value = "chartList", method = RequestMethod.GET, produces = "text/plain; charset=UTF-8")
	public @ResponseBody String chartList(Locale locale, Model model, HttpSession session) {
				
		
		
		Gson gson = new Gson();
		List<WeightVO> list = service.getChart(pet_num2);
		System.out.println(pet_num2+"펫넘1");
		System.out.println(list);
		return gson.toJson(list);
		
	}
	
	@RequestMapping(value = "activityList", method = RequestMethod.GET, produces = "text/plain; charset=UTF-8")
	public @ResponseBody String activityList(Locale locale, Model model, HttpSession session) {
				
		
		
		Gson gson = new Gson();
		List<ActivityVO> list1 = service.getActivity(pet_num2);
		System.out.println(pet_num2+"펫넘2");
		System.out.println(list1);
		return gson.toJson(list1);
	}
	

}
