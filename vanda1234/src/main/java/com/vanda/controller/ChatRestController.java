package com.vanda.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vanda.domain.MessageVO;
import com.vanda.domain.RoomVO;
import com.vanda.service.ChatService;


@RequestMapping("/chat")
@RestController
public class ChatRestController {
	private Logger log = LoggerFactory.getLogger(ChatRestController.class);
	
	@Autowired
	private ChatService service;
	
	@PostMapping(value="/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> regist(@RequestBody MessageVO vo){
		log.info("MessageVO: "+ vo);
		int result = service.insertMsg(vo);
		
		log.info("register msg result: "+ result);
		
		return result >=1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/chatlist/{room_num}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<MessageVO>> getList(@PathVariable("room_num") int room_num){
		log.info("getMessageList...");
		
		return new ResponseEntity<>(service.msgList(room_num),HttpStatus.OK);
	}
	
	
	
	@PostMapping(value="/roomList/{user_id}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE}) 
	public ResponseEntity<List<RoomVO>> roomList(@PathVariable("user_id") String user_id){
		log.info("roomList..."); 
		
		return new	ResponseEntity<>(service.roomList(user_id),HttpStatus.OK); 
	}
	 
	 
	
}
