package com.vanda.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vanda.common.Criteria;
import com.vanda.domain.GgVO;
import com.vanda.domain.PageDTO;
import com.vanda.domain.PostDTO;
import com.vanda.domain.PostImgVO;
import com.vanda.service.PostService;


@Controller
@RequestMapping("/gg/*")
public class ggController {
	@Autowired
	private PostService service;

	Logger log = LoggerFactory.getLogger(ggController.class);


	@GetMapping("/gglist")
	public void list(Model model) {


		model.addAttribute("list", service.getggList());
		System.out.println(model);
		 
	}
	

	//게시물 작성 처리
	@PostMapping("/register")
	public String register(GgVO gg, RedirectAttributes rttr,Model model) {
		
		String a = "https://img.youtube.com/vi/";
		String b = "/0.jpg";
		String c = "https://www.youtube.com/embed/";
		
		a= a+gg.getGg_Youtubelink()+b;
		c= c+gg.getGg_Youtubelink();
				
		gg.setGg_Youtubesum(a);
		gg.setGg_Youtubelink(c);
		service.ggregister(gg);
		model.addAttribute("list", service.getggList());
		rttr.addFlashAttribute("result", gg.getGg_Num());
		
		return "redirect:/gg/gglist";

	}
	
	@GetMapping({"/ggget", "/ggmodify"})
	public void ggget(@RequestParam("gg_Num") int gg_Num, Model model) {
		
		model.addAttribute("gg", service.ggget(gg_Num));
	}
	
	@PostMapping("/ggremove")
	public String ggremove(int gg_Num) {
	
		service.ggremove(gg_Num);
		
		return "redirect:/gg/gglist";
	}
	
	@PostMapping("/ggmodify")
	public String ggmodify(GgVO gg) {
		String a = "https://img.youtube.com/vi/";
		String b = "/0.jpg";
		String c = "https://www.youtube.com/embed/";
		String YoutubeLink= c+gg.getGg_Link();
		String Youtubesum = a+gg.getGg_Link()+b;
		
		System.out.println(gg.getGg_Link());
		System.out.println(YoutubeLink);
		
		gg.setGg_Youtubelink(YoutubeLink);
		gg.setGg_Youtubesum(Youtubesum);
		
		service.ggmodify(gg);
		
		return "redirect:/gg/gglist";
		
	}
	
	

	//게시물 작성 뷰
	@GetMapping("/register")
	public void register() {

	}
	
	
}
