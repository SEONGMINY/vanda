package com.vanda.domain;

public class MemDeviceVO {
	
	private String user_id;
	private String device_id;
	private int pet_num;
	private String device_type;
	private String device_ip;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDevice_id() {
		return device_id;
	}
	public void setDevice_id(String device_id) {
		this.device_id = device_id;
	}
	public int getPet_num() {
		return pet_num;
	}
	public void setPet_num(int pet_num) {
		this.pet_num = pet_num;
	}
	public String getDevice_type() {
		return device_type;
	}
	public void setDevice_type(String device_type) {
		this.device_type = device_type;
	}
	public String getDevice_ip() {
		return device_ip;
	}
	public void setDevice_ip(String device_ip) {
		this.device_ip = device_ip;
	}
	
	public String toString() {
		return "user_id: "+user_id+" pet_num: "+pet_num+" device_ip: "+device_ip+" device_type: "+device_type+"device_id : " + device_id;
				
	}
}
