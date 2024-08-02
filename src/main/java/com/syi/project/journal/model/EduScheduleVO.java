package com.syi.project.journal.model;

import java.util.Date;

public class EduScheduleVO {

	private int scheduleNo; // 일정 번호
	
	private Date scheduleDate; // 일정 날짜
	
	private Date scheduleRegDate; // 일정 등록날짜
	
	private Date scheduleModifyDate; // 일정 수정날짜
	
	private String scheduleTitle; // 일정 제목
	
	private String scheduleDescription; // 일정 설명
	
	private String scheduleInstructor; // 강사
	
	private int classNo; // 반 번호

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public Date getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public Date getScheduleRegDate() {
		return scheduleRegDate;
	}

	public void setScheduleRegDate(Date scheduleRegDate) {
		this.scheduleRegDate = scheduleRegDate;
	}

	public Date getScheduleModifyDate() {
		return scheduleModifyDate;
	}

	public void setScheduleModifyDate(Date scheduleModifyDate) {
		this.scheduleModifyDate = scheduleModifyDate;
	}

	public String getScheduleTitle() {
		return scheduleTitle;
	}

	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}

	public String getScheduleDescription() {
		return scheduleDescription;
	}

	public void setScheduleDescription(String scheduleDescription) {
		this.scheduleDescription = scheduleDescription;
	}

	public String getScheduleInstructor() {
		return scheduleInstructor;
	}

	public void setScheduleInstructor(String scheduleInstructor) {
		this.scheduleInstructor = scheduleInstructor;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	@Override
	public String toString() {
		return "EduScheduleVO [scheduleNo=" + scheduleNo + ", scheduleDate=" + scheduleDate + ", scheduleRegDate="
				+ scheduleRegDate + ", scheduleModifyDate=" + scheduleModifyDate + ", scheduleTitle=" + scheduleTitle
				+ ", scheduleDescription=" + scheduleDescription + ", scheduleInstructor=" + scheduleInstructor
				+ ", classNo=" + classNo + "]";
	}
	
	
}