package com.vanda.domain;

public class HospitalVO {

	private int hosp_tel;
	private String hosp_name;
	private String hosp_content;
	private String hosp_add;

	public HospitalVO() {
	}

	public HospitalVO(String hosp_name,String hosp_content,String hosp_add,int hosp_tel) {
		this.hosp_name=hosp_name;
		this.hosp_content=hosp_content;
		this.hosp_add=hosp_add;
		this.hosp_tel=hosp_tel;
		
	}

	public int getHosp_tel() {
		return hosp_tel;
	}

	public void setHosp_tel(int hosp_tel) {
		this.hosp_tel = hosp_tel;
	}

	public String getHosp_name() {
		return hosp_name;
	}

	public void setHosp_name(String hosp_name) {
		this.hosp_name = hosp_name;
	}

	public String getHosp_content() {
		return hosp_content;
	}

	public void setHosp_content(String hosp_content) {
		this.hosp_content = hosp_content;
	}

	public String getHosp_add() {
		return hosp_add;
	}

	public void setHosp_add(String hosp_add) {
		this.hosp_add = hosp_add;
	}

	

}
