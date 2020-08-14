package com.vanda.domain;

import com.vanda.utils.JsonConvertable;

public class ProductVO extends JsonConvertable {

	public int pro_num;
	public String pro_name;
	public String pro_content;
	public int pro_price;
	public String pro_date;
	public int pro_amount;
	public int count;
	public int rk;
	public int total;

	// 업로드

	public int getRk() {
		return rk;
	}

	public void setRk(int rk) {
		this.rk = rk;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String img_path;
	public String img_name;

	

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public int getPro_num() {
		return pro_num;
	}

	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getPro_content() {
		return pro_content;
	}

	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}

	public int getPro_price() {
		return pro_price;
	}

	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}

	public String getPro_date() {
		return pro_date;
	}

	public void setPro_date(String pro_date) {
		this.pro_date = pro_date;
	}

	public int getPro_amount() {
		return pro_amount;
	}

	public void setPro_amount(int pro_amount) {
		this.pro_amount = pro_amount;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	
	
	
	
}
	