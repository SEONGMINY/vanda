package com.vanda.mapper;

import java.util.List;

import com.vanda.domain.PetImgVO;

public interface PetImgMapper {
	public void insert(PetImgVO vo);

	public void delete(String uuid);

	public List<PetImgVO> findBypostNum(int petNum);
	
	public void deleteAll(int petNum);
}
