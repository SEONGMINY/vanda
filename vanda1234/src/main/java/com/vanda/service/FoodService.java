package com.vanda.service;

import java.util.List;

import com.vanda.domain.ActivityVO;
import com.vanda.domain.EatVO;
import com.vanda.domain.FoodVO;
import com.vanda.domain.KindVO;
import com.vanda.domain.PetImgVO;
import com.vanda.domain.PetInfoVO;
import com.vanda.domain.PetVO;
import com.vanda.domain.WeightVO;

public interface FoodService {

  //food_num 가져오기
	public String getfood(int pet_num);
}