package com.vanda.mapper;

import java.util.ArrayList;

import com.vanda.domain.FoodVO;
import com.vanda.domain.KindVO;

public interface KindMapper {


	//견종 리스트
	public ArrayList<KindVO> kindList();
	
	//견종에 따른 음식리스트
	public ArrayList<FoodVO> foodList(int kind_num);
}
