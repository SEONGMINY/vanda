package com.vanda.domain;

import java.sql.Timestamp;

public class EatVO {
	
	private String pet_num;
	private Timestamp eat_time;
	private int eat_gram;

	
public EatVO() {}
	
	public EatVO(String pet_num, Timestamp eat_time, int eat_gram) {
		this.pet_num=pet_num;
		this.eat_time=eat_time;
		this.eat_gram=eat_gram;
	}
	
	public String getPet_num() {
		return pet_num;
	}
	public void setPet_num(String pet_num) {
		this.pet_num = pet_num;
	}
	public Timestamp getEat_time() {
		return eat_time;
	}
	public void setEat_time(Timestamp eat_time) {
		this.eat_time = eat_time;
	}
	public int getEat_gram() {
		return eat_gram;
	}
	public void setEat_gram(int eat_gram) {
		this.eat_gram = eat_gram;
	}

	
	

}
