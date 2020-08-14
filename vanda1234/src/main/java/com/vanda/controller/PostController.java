package com.vanda.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

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
import com.vanda.domain.PageDTO;
import com.vanda.domain.PostDTO;
import com.vanda.domain.PostImgVO;
import com.vanda.service.PostService;

@Controller
@RequestMapping("/post/*")
public class PostController {
	@Autowired
	private PostService service;

	Logger log = LoggerFactory.getLogger(PostController.class);

	/*
	 * @RequestMapping(value="/page", method=RequestMethod.GET) public String
	 * postPage(Model model) { return "post"; }
	 * 
	 * @RequestMapping(value="/list", method=RequestMethod.GET) public List<PostDTO>
	 * getPost(@RequestParam Criteria criteria){ return
	 * this.service.getPost(criteria); }
	 */

	//뷰 보여주는부분
	@GetMapping("/postlist")
	public void list(Criteria crt, Model model) {	
		int total = service.getTotal(crt);
		System.out.println(total);
		
		List<PostDTO> list = service.getListWithPaging(crt);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(crt, total));
		
		System.out.println(list.size());
		
	
		
		System.out.println(crt);

		System.out.println(model.getAttribute("pageMaker"));
	
	}

	//게시물 작성 처리
	@PostMapping("/register")
	public String register(PostDTO post, RedirectAttributes rttr) {

		log.info("---------------");
		log.info("register:" + post);
		
		if (post.getImgList() != null) {
			post.getImgList().forEach((img) -> log.info(img.toString()));
		}
		log.info("--------------");

		service.register(post);
		rttr.addFlashAttribute("result", post.getPostNum());
		return "redirect:/post/postlist";

	}

	//게시물 상세정보,수정
	@GetMapping({ "/postget", "/modify" })
	public void get(@RequestParam("postNum") int postNum, @ModelAttribute("crt") Criteria crt, Model model) {

		model.addAttribute("post", service.get(postNum));
	}

	
	//수정 포스트방식 처리
	@PostMapping("/modify")
	public String modify(PostDTO post, Criteria crt, RedirectAttributes rttr) {
		
		if(service.modify(post)) {
			rttr.addFlashAttribute("result", "success");
		}
		
	
		rttr.addAttribute("pageNum", crt.getPageNum());
		rttr.addAttribute("amount", crt.getAmount());
		rttr.addAttribute("type", crt.getType());
		rttr.addAttribute("keyword", crt.getKeyword());
		
		return "redirect:/post/postlist";
	}

	//삭제 포스트방식
	@PostMapping("/remove")
	public String remove(int postNum, Criteria crt, RedirectAttributes rttr) {
//		service.remove(postNum);
//		rttr.addFlashAttribute("result", "success");
//		rttr.addAttribute("pageNum", crt.getPageNum());
//		rttr.addAttribute("amount", crt.getAmount());
//		rttr.addAttribute("type", crt.getType());
//		rttr.addAttribute("keyword", crt.getKeyword());
//		return "redirect:/post/postlist";
		
		
		
		List<PostImgVO> imgList = service.getImgList(postNum);
		service.removeReply(postNum);
		if(service.remove(postNum)) {
			
			deleteFiles(imgList);
			
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/post/postlist" + crt.getListLink();
	}

	
	//게시물 작성 뷰
	@GetMapping("/register")
	public void register() {

	}
	
	//ajax 통신 이미지 리스트 가져와줌
	@GetMapping(value = "/getImgList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
		public ResponseEntity<List<PostImgVO>> getImgList(int postNum){
			return new ResponseEntity<>(service.getImgList(postNum), HttpStatus.OK);
		}
	
	private void deleteFiles(List<PostImgVO> imgList) {
		
		if(imgList == null || imgList.size() == 0) {
			return;
		}
		
		imgList.forEach(attach ->{
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_" + attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+ attach.getFileName());
					
					Files.delete(thumbNail);
				}
				
			}catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			}
			
		});
	}
	
}
