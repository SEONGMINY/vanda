package com.vanda.domain;

public class KakaoVO {	
	private String user_id;
	private String user_sex;
	private String user_name;
	private String user_pass;




public KakaoVO() {}

public KakaoVO(String user_id, String user_sex,String user_name,String user_pass) {
	this.user_id=user_id;
	this.user_sex=user_sex;
	this.user_name=user_name;
	this.user_pass=user_pass;

	
}
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}



public String getUser_sex() {
	return user_sex;
}

public String getUser_name() {
	return user_name;
}

public void setUser_name(String user_name) {
	this.user_name = user_name;
}

public void setUser_sex(String user_sex) {
	this.user_sex = user_sex;
}

public String getUser_pass() {
	return user_pass;
}

public void setUser_pass(String user_pass) {
	this.user_pass = user_pass;
}

public String toString() {
	return "user_id: "+user_id+"user_sex"+user_sex+"user_name :" + user_name+"user_pass : " + user_pass;
			
}


}
