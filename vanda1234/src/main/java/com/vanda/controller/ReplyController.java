package com.vanda.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vanda.common.Criteria;
import com.vanda.domain.ReplyPageDTO;
import com.vanda.domain.ReplyVO;
import com.vanda.service.ReplyService;

@Controller
@RequestMapping("/replies/*")
public class ReplyController {
	Logger log = LoggerFactory.getLogger(ReplyController.class);
	@Autowired
	private ReplyService service;
	
	@PostMapping(value ="/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		
		int insertCount= service.register(vo);
		
		return insertCount >= 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{postNum}/{page}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("postNum") int postNum){
			
			Criteria crt = new Criteria(page,10);
	
			return new ResponseEntity<>(service.getListPage(crt, postNum), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{replyNum}",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("replyNum") int replyNum){
		
		return new ResponseEntity<>(service.get(replyNum), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{replyNum}",
				produces = {MediaType.TEXT_PLAIN_VALUE})
		
		public ResponseEntity<String> remove(@PathVariable("replyNum") int replyNum){
			return service.remove(replyNum)==1
					? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{replyNum}",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO vo,
			@PathVariable("replyNum") int replyNum){
		vo.setReplyNum(replyNum);
		
		return service.modify(vo) ==1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
