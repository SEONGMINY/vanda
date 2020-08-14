package com.vanda.service;

import java.util.List;

import com.vanda.common.Criteria;
import com.vanda.domain.ReplyPageDTO;
import com.vanda.domain.ReplyVO;

public interface ReplyService {
	public int register(ReplyVO vo);
	
	public ReplyVO get(int replyNum);
	
	public int modify(ReplyVO vo);
	
	public int remove(int replyNum);
	
	public List<ReplyVO> getList(Criteria crt, int postNum);
	
	public ReplyPageDTO getListPage(Criteria crt, int postNum);
}
