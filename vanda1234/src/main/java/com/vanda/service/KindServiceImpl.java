package com.vanda.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vanda.domain.FoodVO;
import com.vanda.domain.KindVO;
import com.vanda.mapper.KindMapper;

@Repository
public class KindServiceImpl implements KindService {
	
	@Autowired
	private KindMapper kindMapper;
	 
	@Override
	public ArrayList<KindVO> kindList() {
		
		return kindMapper.kindList();
	}

	@Override
	public ArrayList<FoodVO> foodList(int kind_num) {
		return kindMapper.foodList(kind_num);
	}
	
	

	
}
