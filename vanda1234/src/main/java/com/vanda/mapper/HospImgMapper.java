package com.vanda.mapper;

import java.util.List;

import com.vanda.domain.HospImgVO;

public interface HospImgMapper {
   public void insert(HospImgVO vo);

   public List<HospImgVO> getImgList(String hosp_num);

   
}