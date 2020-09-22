package com.vanda.domain;

public class HospImgVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private int hosp_num;
	
	
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
	public int gethosp_num() {
		return hosp_num;
	}
	public void sethosp_num(int hosp_num) {
		this.hosp_num = hosp_num;
	}
	
	
	
}
