package com.vanda.domain;

import java.util.Date;

public class WeightVO {
	private int pet_num;
	private double pet_weight;
	private Date weight_date;
	
	public WeightVO(){}
	public WeightVO(int pet_num,double pet_weight,Date weight_date) {
		this.pet_num = pet_num;
		this.pet_weight = pet_weight;
		this.weight_date = weight_date;
	}
	public int getPet_num() {
		return pet_num;
	}
	public void setPet_num(int pet_num) {
		this.pet_num = pet_num;
	}
	public double getPet_weight() {
		return pet_weight;
	}
	public void setPet_weight(double pet_weight) {
		this.pet_weight = pet_weight;
	}
	public Date getWeight_date() {
		return weight_date;
	}
	public void setWeight_date(Date weight_date) {
		this.weight_date = weight_date;
	} 
	
	 
}
 