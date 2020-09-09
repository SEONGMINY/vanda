package com.vanda.service;

import java.util.List;

import org.json.simple.JSONObject;

import com.vanda.domain.ActivityVO;
import com.vanda.domain.WeightVO;

public interface ChartService {
	public List<WeightVO> getChart(int pet_num);
	
	public List<ActivityVO> getActivity(int pet_num);
	
}