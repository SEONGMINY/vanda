package com.vanda.service;

import java.util.List;

import com.vanda.domain.MessageVO;
import com.vanda.domain.RoomVO;



public interface ChatService {
	

	public void insert(RoomVO vo);
	public List<RoomVO> roomList(String user_id);
	public List<RoomVO> roomDocList(String user_id);
	public RoomVO getRoom(int room_num);
	public List<MessageVO> msgList(int room_num);
	public int insertMsg(MessageVO msg);
	
}
