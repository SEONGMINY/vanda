package com.vanda.mapper;

import java.util.List;

import com.vanda.domain.PostImgVO;

public interface PostImgMapper {
	public void insert(PostImgVO vo);

	public void delete(String uuid);

	public List<PostImgVO> findBypostNum(int postNum);
	
	public void deleteAll(int postNum);
}
