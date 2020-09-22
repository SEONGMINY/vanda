package com.vanda.domain;

import java.util.List;

public class PostDTO {
	private int post_Num;
	private int class_Num;
	private String user_Id;
	private String post_Title;
	private String post_Content;
	private String post_Date;
	private int post_Count;
	private String serCategory;

	public List<PostImgVO> getImgList1() {
		return imgList1;
	}
	public void setImgList1(List<PostImgVO> imgList1) {
		this.imgList1 = imgList1;
	}
	private List<PostImgVO> imgList;
	
	private List<PostImgVO> imgList1;
	
	public List<PostImgVO> getImgList() {
		return imgList;
	}
	public void setImgList(List<PostImgVO> imgList) {
		this.imgList = imgList;
	}
	

	
	public int getPostNum() {
		return post_Num;
	}
	public void setPostNum(int post_Num) {
		this.post_Num = post_Num;
	}
	public int getClassNum() {
		return class_Num;
	}
	public void setClassNum(int class_Num) {
		this.class_Num = class_Num;
	}
	public String getUserId() {
		return user_Id;
	}
	public void setUserId(String user_Id) {
		this.user_Id = user_Id;
	}
	public String getPostTitle() {
		return post_Title;
	}
	public void setPostTitle(String post_Title) {
		this.post_Title = post_Title;
	}
	public String getPostContent() {
		return post_Content;
	}
	public void setPostContent(String post_Content) {
		this.post_Content = post_Content;
	}
	public String getPostDate() {
		return post_Date;
	}
	public void setPostDate(String post_Date) {
		this.post_Date = post_Date;
	}
	public int getPostCount() {
		return post_Count;
	}
	public void setPostCount(int post_Count) {
		this.post_Count = post_Count;
	}
	public String getSerCategory() {
		return serCategory;
	}
	public void setSerCategory(String serCategory) {
		this.serCategory = serCategory;
	}

	
}
