package com.syi.project.journal.model;

import java.util.Date;

public class JournalFileVO {
	
	private int fileNo; // 첨부파일 번호
	
	private String fileOriginName; // 파일 원본 이름
	
	private String fileSavedName; // 파일 저장 이름
	
	private String fileType; // 파일 유형?
	
	private int fileSize; // 파일 크기
	
	private String filePath; // 파일 경로
	
	private Date fileRegDate; // 파일 등록 날짜
	
	private int journalNo; // 일지 번호

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileOriginName() {
		return fileOriginName;
	}

	public void setFileOriginName(String fileOriginName) {
		this.fileOriginName = fileOriginName;
	}

	public String getFileSavedName() {
		return fileSavedName;
	}

	public void setFileSavedName(String fileSavedName) {
		this.fileSavedName = fileSavedName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getFileRegDate() {
		return fileRegDate;
	}

	public void setFileRegDate(Date fileRegDate) {
		this.fileRegDate = fileRegDate;
	}
	
	public int getJournalNo() {
		return journalNo;
	}

	public void setJournalNo(int journalNo) {
		this.journalNo = journalNo;
	}

	@Override
	public String toString() {
		return "JournalFileVO [fileNo=" + fileNo + ", fileOriginName=" + fileOriginName + ", fileSavedName="
				+ fileSavedName + ", fileType=" + fileType + ", fileSize=" + fileSize + ", filePath=" + filePath
				+ ", fileRegDate=" + fileRegDate + ", journalNo=" + journalNo + "]";
	}


}