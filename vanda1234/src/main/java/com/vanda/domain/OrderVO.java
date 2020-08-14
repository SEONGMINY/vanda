package com.vanda.domain;

import java.util.Date;

public class OrderVO {

	private int ord_num;
	private String recip_name;
	private String recip_add;
	private String recip_add2;
	private String recip_add3;
	private String recip_tel;
	private String ord_msg;
	private String pay_category;
	private String pay_price;
	private String user_id;
	private Date ord_date;
	
	public int getOrd_num() {
		return ord_num;
	}
	public void setOrd_num(int ord_num) {
		this.ord_num = ord_num;
	}

	public String getRecip_name() {
		return recip_name;
	}
	public void setRecip_name(String recip_name) {
		this.recip_name = recip_name;
	}
	public String getRecip_add() {
		return recip_add;
	}
	public void setRecip_add(String recip_add) {
		this.recip_add = recip_add;
	}
	public String getRecip_add2() {
		return recip_add2;
	}
	public void setRecip_add2(String recip_add2) {
		this.recip_add2 = recip_add2;
	}
	public String getRecip_add3() {
		return recip_add3;
	}
	public void setRecip_add3(String recip_add3) {
		this.recip_add3 = recip_add3;
	}
	public String getRecip_tel() {
		return recip_tel;
	}
	public void setRecip_tel(String recip_tel) {
		this.recip_tel = recip_tel;
	}
	public String getOrd_msg() {
		return ord_msg;
	}
	public void setOrd_msg(String ord_msg) {
		this.ord_msg = ord_msg;
	}
	public String getPay_category() {
		return pay_category;
	}
	public void setPay_category(String pay_category) {
		this.pay_category = pay_category;
	}
	public String getPay_price() {
		return pay_price;
	}
	public void setPay_price(String pay_price) {
		this.pay_price = pay_price;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}
	
	
	


	
	
	
	
}