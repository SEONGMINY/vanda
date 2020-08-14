package com.vanda.domain;



public class FoodVO {
	
	private int food_num;
	private String food_name;
	private String food_ps;

	
public FoodVO() {}
	
	public FoodVO(int food_num, String food_name, String food_ps) {
		this.food_num=food_num;
		this.food_name=food_name;
		this.food_ps=food_ps;
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
