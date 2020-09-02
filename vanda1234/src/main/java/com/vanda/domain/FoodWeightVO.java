package com.vanda.domain;

public class FoodWeightVO {
	private int food_num;
	private String food_name;
	private int low_weight;
	private int high_weight;
	private int gram;
	
	
	
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public int getFood_num() {
		return food_num;
	}
	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}
	public int getLow_weight() {
		return low_weight;
	}
	public void setLow_weight(int low_weight) {
		this.low_weight = low_weight;
	}
	public int getHigh_weight() {
		return high_weight;
	}
	public void setHigh_weight(int high_weight) {
		this.high_weight = high_weight;
	}
	public int getGram() {
		return gram;
	}
	public void setGram(int gram) {
		this.gram = gram;
	}
	
	

}
