package com.vanda.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vanda.common.Criteria;
import com.vanda.domain.ReplyPageDTO;
import com.vanda.domain.ReplyVO;
import com.vanda.mapper.ReplyMapper;



@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(int replyNum) {
		return mapper.read(replyNum);
	}

	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int remove(int replyNum) {
		return mapper.delete(replyNum);
	}

	@Override
	public List<ReplyVO> getList(Criteria crt, int postNum) {
		return mapper.getListWithPaging(crt, postNum);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria crt, int postNum) {
		return new ReplyPageDTO(
				mapper.getCountBypostNum(postNum),
				mapper.getListWithPaging(crt, postNum));
	}

}
