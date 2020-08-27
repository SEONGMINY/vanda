package com.vanda.domain;

import java.util.Date;

public class RoomVO {
	private int room_num;
	private String user_id;
	private String doc_id;
	private Date room_date;
	
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDoc_id() {
		return doc_id;
	}
	public void setDoc_id(String doc_id) {
		this.doc_id = doc_id;
	}
	public Date getRoom_date() {
		return room_date;
	}
	public void setRoom_date(Date room_date) {
		this.room_date = room_date;
	}
	
	public String toStirng() {
		return "room_num["+room_num+"] user_id["+user_id+"] doc_id["+doc_id+"]";
	}


}
