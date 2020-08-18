package com.vanda.domain;

public class PetInfoVO {

	private String pet_name;
	private int pet_num;
	private double pet_weight;
	private double eat_gram;
	private double gram;
	private double avg; // 종 평균 몸무게
	private String kind_name;
	private double total_distance;

	public PetInfoVO() {
	}

	public PetInfoVO(String pet_name, double eat_gram, double pet_weight, double total_distance) {
		this.pet_name = pet_name;
		this.eat_gram = eat_gram;
		this.pet_weight = pet_weight;
		this.total_distance = total_distance;
	}

	public double getTotal_distance() {
		return total_distance;
	}

	public void setTotal_distance(double total_distance) {
		this.total_distance = total_distance;
	}

	public double getEat_gram() {
		return eat_gram;
	}

	public void setEat_gram(double eat_gram) {
		this.eat_gram = eat_gram;
	}

	public double getPet_weight() {
		return pet_weight;
	}

	public void setPet_weight(double pet_weight) {
		this.pet_weight = pet_weight;
	}

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public int getPet_num() {
		return pet_num;
	}

	public void setPet_num(int pet_num) {
		this.pet_num = pet_num;
	}

	public double getGram() {
		return gram;
	}

	public void setGram(double gram) {
		this.gram = gram;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public String getKind_name() {
		return kind_name;
	}

	public void setKind_name(String kind_name) {
		this.kind_name = kind_name;
	}

}