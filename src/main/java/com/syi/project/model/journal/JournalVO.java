package com.syi.project.model.journal;

import java.util.Date;
import java.util.List;

public class JournalVO {

	private int journalNo; // 일지 번호

	private Date journalDate; // 일지 작성일자

	private Date journalModify; // 일지 수정일자
	
	private String journalTitle; // 일지 제목
	
	private List<JournalFileVO> journalFileList; // 첨부파일 정보

	public int getJournalNo() {
		return journalNo;
	}

	public void setJournalNo(int journalNo) {
		this.journalNo = journalNo;
	}

	public Date getJournalDate() {
		return journalDate;
	}

	public void setJournalDate(Date journalDate) {
		this.journalDate = journalDate;
	}

	public Date getJournalModify() {
		return journalModify;
	}

	public void setJournalModify(Date journalModify) {
		this.journalModify = journalModify;
	}

	public String getJournalTitle() {
		return journalTitle;
	}

	public void setJournalTitle(String journalTitle) {
		this.journalTitle = journalTitle;
	}


	public List<JournalFileVO> getJournalFileList() {
		return journalFileList;
	}

	public void setJournalFileList(List<JournalFileVO> journalFileList) {
		this.journalFileList = journalFileList;
	}

	@Override
	public String toString() {
		return "JournalVO [journalNo=" + journalNo + ", journalDate=" + journalDate + ", journalModify=" + journalModify
				+ ", journalTitle=" + journalTitle + ", journalFileList=" + journalFileList + "]";
	}


}