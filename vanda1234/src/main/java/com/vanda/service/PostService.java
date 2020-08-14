package com.vanda.service;

import java.util.List;

import com.vanda.common.Criteria;
import com.vanda.domain.PostDTO;
import com.vanda.domain.PostImgVO;


public interface PostService {
	
	public void register(PostDTO board);
	
	public PostDTO get(int postNum);
	
	public boolean modify(PostDTO board);
	
	public boolean remove(int postNum);
	
	public void removeReply(int postNum);
	
	public List<PostDTO> getListWithPaging(Criteria crt);
	public List<PostDTO> getList(Criteria crt);
	public List<PostDTO> gggetList(Criteria crt);
	public List<PostDTO> htgetList(Criteria crt);
	
	public int getTotal(Criteria crt);
	
	//공식정보
	public int gggetTotal(Criteria crt);
	
	public int htgetTotal(Criteria crt);
	
	public List<PostImgVO> getImgList(int postNum);
}
