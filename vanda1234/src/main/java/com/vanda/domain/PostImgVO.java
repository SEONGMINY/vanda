package com.vanda.domain;

public class PostImgVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private int postNum;
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public boolean isFileType() {
		return fileType;
	}
	public void setFileType(boolean fileType) {
		this.fileType = fileType;
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int post_Num) {
		this.postNum = post_Num;
	}
	
	@Override
	public String toString() {
		return "PostImgVO [uuid=" + uuid + ", uploadPath=" + uploadPath + ", fileName=" + fileName + ", fileType="
				+ fileType + ", post_Num=" + postNum + "]";
	}
	
}
