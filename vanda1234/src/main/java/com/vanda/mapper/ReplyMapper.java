package com.vanda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.vanda.common.Criteria;
import com.vanda.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(int reply_Num);
	
	public int delete(int reply_Num);
	
	public int update(ReplyVO reply_Content);
	
	public List<ReplyVO> getListWithPaging(
			@Param("crt") Criteria crt,
			@Param("postNum") int postNum);
	
	public int getCountBypostNum(int postNum);
}
