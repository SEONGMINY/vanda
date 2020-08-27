package com.vanda.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vanda.domain.MessageVO;
import com.vanda.domain.RoomVO;
import com.vanda.mapper.ChatMapper;



@Service
public class ChatServiceImpl implements ChatService {
	

	
	@Autowired
	private ChatMapper mapper;

	@Override
	public void insert(RoomVO vo) {
		mapper.insert(vo);
	}

	@Override
	public List<RoomVO> roomList(String user_id) {

		return mapper.roomList(user_id);
	}
	
	@Override
	public List<RoomVO> roomDocList(String user_id) {

		return mapper.roomDocList(user_id);
	}



	@Override
	public RoomVO getRoom(int room_num) {

		return mapper.getRoom(room_num);
	}

	@Override
	public List<MessageVO> msgList(int room_num) {

		return mapper.msgList(room_num);
	}

	@Override
	public int insertMsg(MessageVO msg) {

		return mapper.insertMsg(msg);
	}

	
}
