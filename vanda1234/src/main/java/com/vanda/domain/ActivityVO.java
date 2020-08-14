package com.vanda.domain;

public class ActivityVO {
	private int pet_num;
	private String act_path;
	private String act_name;
	private int act_num;
	private double total_distance;
	private String timer;
	
	public String getTimer() {
		return timer;
	}
	public void setTimer(String timer) {
		this.timer = timer;
	}
	public double getTotal_distance() {
		return total_distance;
	}
	public void setTotal_distance(double total_distance) {
		this.total_distance = total_distance;
	}
	public int getPet_num() {
		return pet_num;
	}
	public void setPet_num(int pet_num) {
		this.pet_num = pet_num;
	}
	public String getAct_path() {
		return act_path;
	}
	public void setAct_path(String act_path) {
		this.act_path = act_path;
	}
	public String getAct_name() {
		return act_name;
	}
	public void setAct_name(String act_name) {
		this.act_name = act_name;
	}
	public int getAct_num() {
		return act_num;
	}
	public void setAct_num(int act_num) {
		this.act_num = act_num;
	}
	
	
}
