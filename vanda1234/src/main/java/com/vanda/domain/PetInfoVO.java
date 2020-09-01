package com.vanda.domain;

public class PetInfoVO {

	private String pet_name;	//펫 이름
	private int pet_num;	//펫 번호
	private double pet_weight;		//펫 현재몸무게
	private double eat_gram;		//펫 현재 먹은 배식량 
	private double gram;			//펫 추천 배식량
	private double avg; // 펫 권장 체중
	private String kind_name;	
	private double total_distance;	//현재 활동량
	private double recomand_distance;	//추천 활동량
	private int food_num;
	
	
	public PetInfoVO() {
	}

	public PetInfoVO(String pet_name, double eat_gram, double pet_weight, double total_distance, double recomand_distance,int food_num) {
		this.pet_name = pet_name;
		this.eat_gram = eat_gram;
		this.pet_weight = pet_weight;
		this.total_distance = total_distance;
		this.recomand_distance = recomand_distance;
		this.food_num = food_num;
	}


	public int getFood_num() {
		return food_num;
	}

	public void setFood_num(int food_num) {
		this.food_num = food_num;
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

	public double getRecomand_distance() {
		return recomand_distance;
	}

	public void setRecomand_distance(double recomand_distance) {
		this.recomand_distance = recomand_distance;
	}

	

}