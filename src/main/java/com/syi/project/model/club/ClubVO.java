package com.syi.project.model.club;

import java.util.Date;

public class ClubVO {
	
	private int clubNo;	//동아리코드번호
	private String content;	//동아리신청내용
	private String join;	//참가자명단
	private Date studyDate;	//활동날짜
	private Date regDate;	//등록날짜
	private String checkStatus;	//'Y', 'N', 'W' 승인
	private String checkCmt;	//승인메시지
	private int classNo;	//반 코드번호
	private int userMemberNo;	//신청자번호 
	private int adminMemberNo;	//담당자번호
	
	
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
	public int getUserMemberNo() {
		return userMemberNo;
	}
	public void setUserMemberNo(int userMemberNo) {
		this.userMemberNo = userMemberNo;
	}
	public int getAdminMemberNo() {
		return adminMemberNo;
	}
	public void setAdminMemberNo(int adminMemberNo) {
		this.adminMemberNo = adminMemberNo;
	}
	@Override
	public String toString() {
		return "ClubVO [clubNo=" + clubNo + ", content=" + content + ", join=" + join + ", studyDate=" + studyDate
				+ ", regDate=" + regDate + ", checkStatus=" + checkStatus + ", checkCmt=" + checkCmt + ", classNo="
				+ classNo + ", userMemberNo=" + userMemberNo + ", adminMemberNo=" + adminMemberNo + "]";
	}
	
}
