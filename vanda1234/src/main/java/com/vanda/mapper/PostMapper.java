package com.vanda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.vanda.common.Criteria;
import com.vanda.domain.PostDTO;

public interface PostMapper {

	public List<PostDTO> getList(); 
	
	public void insert(PostDTO post);
	
	public void insertSelectKey(PostDTO post);
	
	public PostDTO read(int postNum);
	
	public int delete(int postNum);
	
	public int removeReply(@Param("postNum")int postNum);
	
	public int update(PostDTO post);
	
	public List<PostDTO> getListWithPaging(Criteria crt);
	public List<PostDTO> gggetListWithPaging(Criteria crt);
	public List<PostDTO> htgetListWithPaging(Criteria crt);
		
	public int getTotalCount(Criteria crt);
	public int gggetTotalCount(Criteria crt);
	public int htgetTotalCount(Criteria crt);

	public int increase(int postNum);
}
