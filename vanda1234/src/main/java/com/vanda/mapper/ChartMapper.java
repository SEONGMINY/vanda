package com.vanda.mapper;

import java.util.List;

import com.vanda.domain.ActivityVO;
import com.vanda.domain.WeightVO;

public interface ChartMapper {
	public List<WeightVO> getChart(int pet_num);

	public List<ActivityVO> getActivity(int pet_num);
	
}
