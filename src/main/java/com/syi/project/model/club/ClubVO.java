package com.syi.project.model.club;

import java.util.Date;

public class ClubVO {
	
	private int clubNo;
	private String content;
	private String join;
	private Date studyDate;
	private Date studyTime;
	private Date regDate;
	private String checkStatus; //'Y', 'N', 'W'
	private String checkCmt;
	private int classNo;
	private int memberNo;
	
	
	
	public int getClubNo() {
		return clubNo;
	}
	public void setClubNo(int clubNo) {
		this.clubNo = clubNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getJoin() {
		return join;
	}
	public void setJoin(String join) {
		this.join = join;
	}
	public Date getStudyDate() {
		return studyDate;
	}
	public void setStudyDate(Date studyDate) {
		this.studyDate = studyDate;
	}
	public Date getStudyTime() {
		return studyTime;
	}
	public void setStudyTime(Date studyTime) {
		this.studyTime = studyTime;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getCheckStatus() {
		return checkStatus;
	}
	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}
	public String getCheckCmt() {
		return checkCmt;
	}
	public void setCheckCmt(String checkCmt) {
		this.checkCmt = checkCmt;
	}
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "ClubVO [clubNo=" + clubNo + ", content=" + content + ", join=" + join + ", checkStatus=" + checkStatus
				+ ", checkCmt=" + checkCmt + ", classNo=" + classNo + ", memberNo=" + memberNo + "]";
	}

}
