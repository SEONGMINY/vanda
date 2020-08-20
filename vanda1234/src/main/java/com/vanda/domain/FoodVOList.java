package com.vanda.domain;

import java.util.ArrayList;

import com.vanda.utils.JsonConvertable;

public class FoodVOList extends JsonConvertable{
	
	public ArrayList<FoodVO> lists;
	
	public FoodVOList() {
		lists = new ArrayList<FoodVO>();
	}
}
