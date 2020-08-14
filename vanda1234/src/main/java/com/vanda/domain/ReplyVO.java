package com.vanda.domain;

public class ReplyVO {
	private int reply_Num;
	private int post_Num;
	private String user_Id;
	private String reply_Content;
	private String reply_Date;
	
	public int getReplyNum() {
		return reply_Num;
	}
	public void setReplyNum(int reply_Num) {
		this.reply_Num = reply_Num;
	}
	public int getPostNum() {
		return post_Num;
	}
	public void setPostNum(int post_Num) {
		this.post_Num = post_Num;
	}
	public String getUserId() {
		return user_Id;
	}
	public void setUserId(String user_Id) {
		this.user_Id = user_Id;
	}
	public String getReplyContent() {
		return reply_Content;
	}
	public void setReplyContent(String reply_Content) {
		this.reply_Content = reply_Content;
	}
	public String getReplyDate() {
		return reply_Date;
	}
	public void setReplyDate(String reply_Date) {
		this.reply_Date = reply_Date;
	}
	@Override
	public String toString() {
		return "ReplyVO [reply_Num=" + reply_Num + ", post_Num=" + post_Num + ", user_Id=" + user_Id + ", reply_Content="
				+ reply_Content + ", reply_Date=" + reply_Date + "]";
	}
}
