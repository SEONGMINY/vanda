package com.vanda.domain;

import java.util.List;

public class PetVO {

	private String pet_name;
	private String pet_age;
	private String pet_sex; // M수컷 F암컷
	private String pet_check; // 0은 중성화 x 1은 중성화 o
	private int kind_num;
	private int pet_num;
	private int food_num;
	
	private List<PetImgVO> imgList;

	public List<PetImgVO> getImgList() {
		return imgList;
	}

	public void setImgList(List<PetImgVO> imgList) {
		this.imgList = imgList;
	}

	public PetVO() {
	}

	public PetVO(String pet_name, String pet_age, String pet_sex, String pet_check, int kind_num, int pet_num,
			int food_num) {
		this.pet_name = pet_name;
		this.pet_age = pet_age;
		this.pet_sex = pet_sex;
		this.pet_check = pet_check;
		this.kind_num = kind_num;
		this.pet_num = pet_num;
		this.food_num = food_num;
	}

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public String getPet_age() {
		return pet_age;
	}

	public void setPet_age(String pet_age) {
		this.pet_age = pet_age;
	}

	public String getPet_sex() {
		return pet_sex;
	}

	public void setPet_sex(String pet_sex) {
		this.pet_sex = pet_sex;
	}

	public String getPet_check() {
		return pet_check;
	}

	public void setPet_check(String pet_check) {
		this.pet_check = pet_check;
	}

	public int getKind_num() {
		return kind_num;
	}

	public void setKind_num(int kind_num) {
		this.kind_num = kind_num;
	}

	public int getPet_num() {
		return pet_num;
	}

	public void setPet_num(int pet_num) {
		this.pet_num = pet_num;
	}

	
	 public int getFood_num() {
		 return food_num;
		 }
	 
	 public void setFood_num(int food_num) {
		 this.food_num = food_num;
		 }
	 
	public String toString() {
		return "pet_name:" + pet_name + "pet_age:" + pet_age + "pet_sex:" + pet_sex + "pet_check:" + pet_check
				+ "kind_num:" + kind_num + "pet_num : " + pet_num + "food_num" + food_num;
	}

}
