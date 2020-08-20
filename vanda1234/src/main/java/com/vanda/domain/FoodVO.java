package com.vanda.domain;

import com.vanda.utils.JsonConvertable;

public class FoodVO extends JsonConvertable {
	
	public int food_num;
	public String food_name;
	public String food_ps;
	public int kind_num;

	
	public FoodVO() {}
	
	public FoodVO(int food_num, String food_name, String food_ps, int kind_num) {
		this.food_num=food_num;
		this.food_name=food_name;
		this.food_ps=food_ps;
		this.kind_num=kind_num;
	}
	
	
	
	public int getKind_num() {
		return kind_num;
	}

	public void setKind_num(int kind_num) {
		this.kind_num = kind_num;
	}

	public int getFood_num() {
		return food_num;
	}

	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getFood_ps() {
		return food_ps;
	}

	public void setFood_ps(String food_ps) {
		this.food_ps = food_ps;
	}
	
	
	
	

}
