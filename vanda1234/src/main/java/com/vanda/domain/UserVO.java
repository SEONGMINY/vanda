package com.vanda.domain;

public class UserVO {

	private String user_id;
	private String user_pass;
	private String user_sex;
	private String user_tel;
	private String user_name;
	private String user_rule;
	private String token;


	
	
	public UserVO() {}
	
	public UserVO(String user_id, String user_pass, String user_sex, String user_tel,String user_name,String user_rule) {
		this.user_id=user_id;
		this.user_pass=user_pass;
		this.user_sex=user_sex;
		this.user_tel=user_tel;
		this.user_name=user_name;
		this.user_rule=user_rule;
		
	}
	
	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getUser_rule() {
		return user_rule;
	}

	public void setUser_rule(String user_rule) {
		this.user_rule = user_rule;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}



	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String toString() {
		return "user_id: "+user_id+" user_pass: "+user_pass+" user_sex: "+user_sex+" user_tel: "+user_tel+"user_name : " + user_name;
				
	}
	
	
}
