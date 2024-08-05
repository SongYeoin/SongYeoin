package com.syi.project.model.club;

import java.util.Date;

public class ClubFileVO {

	private int fileNo;
	private String originalName;
	private String savedName;
	private String type;
	private int size;
	private String path;
	private Date regDate;
	private int clubNo;
	
	
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	public String getSavedName() {
		return savedName;
	}
	public void setSavedName(String savedName) {
		this.savedName = savedName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getClubNo() {
		return clubNo;
	}
	public void setClubNo(int clubNo) {
		this.clubNo = clubNo;
	}
	@Override
	public String toString() {
		return "ClubFile [fileNo=" + fileNo + ", originalName=" + originalName + ", savedName=" + savedName + ", type="
				+ type + ", size=" + size + ", path=" + path + ", clubNo=" + clubNo + "]";
	}

}
