package com.vanda.domain;

public class DoctorVO {

	private String user_id;
	private String hosp_tel;


	public DoctorVO() {
	}

	public DoctorVO(String user_id, String hosp_tel) {
		this.user_id = user_id;
		this.hosp_tel = hosp_tel;
	
	}


	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getHosp_tel() {
		return hosp_tel;
	}

	public void setHosp_tel(String hosp_tel) {
		this.hosp_tel = hosp_tel;
	}

	public String toString() {
		return "user_id: " + user_id +"hosp_tel" + hosp_tel;
	}

}
