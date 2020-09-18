package com.vanda.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vanda.common.Criteria;
import com.vanda.domain.GgVO;
import com.vanda.domain.PostDTO;
import com.vanda.domain.PostImgVO;
import com.vanda.mapper.PostImgMapper;
import com.vanda.mapper.PostMapper;


@Service
public class PostServiceImpl implements PostService {
	Logger log = LoggerFactory.getLogger(PostServiceImpl.class);

	@Autowired
	private PostMapper mapper;

	@Autowired
	private PostImgMapper imgMapper;

	@Override
	public void register(PostDTO post) {
		mapper.insertSelectKey(post);

		if (post.getImgList() == null || post.getImgList().size() <= 0) {
			return;
		}

		post.getImgList().forEach(img -> {

			img.setPostNum(post.getPostNum());
			imgMapper.insert(img);
		});
	}

	@Override
	public PostDTO get(int postNum) {
		if (mapper.increase(postNum) != 1) {
			log.error("조회수 업데이트 실패");
		}
		return mapper.read(postNum);
	}

	@Transactional
	@Override
	public boolean modify(PostDTO board) {

		 imgMapper.deleteAll(board.getPostNum()); 

		boolean modifyResult = mapper.update(board) == 1;


		if (modifyResult && board.getImgList() != null && board.getImgList().size() > 0) {
			board.getImgList().forEach(img -> {

				img.setPostNum(board.getPostNum());
				imgMapper.insert(img);

			});
		}

		return modifyResult;

		// mapper.update(board);
	}

	@Transactional
	@Override
	public boolean remove(int postNum) {
		imgMapper.deleteAll(postNum);

		return mapper.delete(postNum) == 1;
	}
	public void removeReply(int postNum) {
		mapper.removeReply(postNum);
	}

	@Override
	public List<PostDTO> getList(Criteria crt) {
		return mapper.getListWithPaging(crt);
	}
	@Override
	public List<PostDTO> htgetList(Criteria crt) {
		return mapper.htgetListWithPaging(crt);
	}


	@Override
	public int getTotal(Criteria crt) {
		return mapper.getTotalCount(crt);
	}

	@Override
	public int htgetTotal(Criteria crt) {
		return mapper.htgetTotalCount(crt);
	}

	@Override
	public List<PostImgVO> getImgList(int postNum) {
		return imgMapper.findBypostNum(postNum);
	}
	
	public List<PostDTO> getListWithPaging(Criteria crt){
		return mapper.getListWithPaging(crt);
	}

	@Override
	public List<GgVO> getggList() {
		return mapper.getggList();
	}

	@Override
	public void ggregister(GgVO gg) {
		mapper.gginsert(gg);
		
	}

	@Override
	public GgVO ggget(int gg_Num) {
		return mapper.ggread(gg_Num);
	}
	
	@Override
	public void ggremove(int gg_Num) {
		mapper.ggremove(gg_Num);
	}
	
	@Override
	public void ggmodify(GgVO gg) {
		mapper.ggmodify(gg);
	}

	@Override
	public List<String> selectYoutube(int gg_Num) {
		return mapper.selectYoutube(gg_Num);
	}

}
