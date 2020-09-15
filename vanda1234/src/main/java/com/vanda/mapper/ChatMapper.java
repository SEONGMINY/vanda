package com.vanda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.vanda.domain.MessageVO;
import com.vanda.domain.RoomVO;



public interface ChatMapper {


	public void insert(@Param("user_id") String user_id,@Param("doc_id") String doc_id);
	public RoomVO getRoom(int room_num);
	public List<RoomVO> roomList(String user_id);
	public List<RoomVO> roomDocList(String user_id);
	public List<MessageVO> msgList(int room_num);
	public int insertMsg(MessageVO msg);
	
}
