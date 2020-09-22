package com.vanda.service;

import java.util.List;

import com.vanda.common.Criteria;
import com.vanda.domain.GgVO;
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
	
	public List<PostDTO> htgetList(Criteria crt);
	
	public int getTotal(Criteria crt);
	
	//공식정보
	
	public int htgetTotal(Criteria crt);
	
	public List<PostImgVO> getImgList(int postNum);
	
	public List<GgVO> getggList();
	
	public void ggregister(GgVO gg);
	
	public GgVO ggget(int gg_Num);
	
	public void ggremove(int gg_Num);
	
	public void ggmodify(GgVO gg);

	public List<String> selectYoutube(int gg_Num);

	public List<PostImgVO> getImgList1(int postNum);

}
