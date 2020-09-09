package com.vanda.service;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vanda.domain.ActivityVO;
import com.vanda.domain.WeightVO;
import com.vanda.mapper.ChartMapper;



@Service
public class ChartServiceImpl implements ChartService {
	
	@Autowired
	private ChartMapper mapper;


	@Override
	public List<WeightVO> getChart(int pet_num) {
		return mapper.getChart(pet_num);
	}


	@Override
	public List<ActivityVO> getActivity(int pet_num) {
		return mapper.getActivity(pet_num);
	}

	
	   
}