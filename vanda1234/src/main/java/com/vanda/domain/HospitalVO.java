package com.vanda.domain;

public class HospitalVO {

	private String hosp_tel;
	private String hosp_name;
	private String hosp_content;
	private String hosp_add;
	private String himg_name;

	public HospitalVO() {
	}

	public HospitalVO(String hosp_name,String hosp_content,String hosp_add,String hosp_tel,String himg_name) {
		this.hosp_name=hosp_name;
		this.hosp_content=hosp_content;
		this.hosp_add=hosp_add;
		this.hosp_tel=hosp_tel;
		this.himg_name=himg_name;
		
	}

	public String getHosp_tel() {
		return hosp_tel;
	}

	public void setHosp_tel(String hosp_tel) {
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

	public String getHimg_name() {
		return himg_name;
	}

	public void setHimg_name(String himg_name) {
		this.himg_name = himg_name;
	}


	

}
