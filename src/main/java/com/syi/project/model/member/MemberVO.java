package com.syi.project.model.member;


import java.sql.Date;

import lombok.Data;

public class MemberVO {
	
	// 멤버 코드
	private int memberNo;
	
	// 멤버 아이디
	private String memberId;
	
	// 멤버 비밀번호
	private String memberPwd;
	
	// 멤버 이름
	private String memberName;
	
	// 멤버 생년월일
	private String memberBirthday;
	
	// 멤버 성별
	private String memberGender;
	
	// 멤버 전화번호
	private String memberPhone;
	
	// 멤버 이메일
	private String memberEmail;
	
	// 멤버 우편번호
	private String memberAddress;
	
	// 멤버 지번주소
	private String memberStreetAddress;
	
	// 멤버 상세주소
	private String memberDetailAddress;
	
	// 멤버 닉네임
	private String memberNickname;
	
	// 멤버 등록일
	private Date memberEnrollDate;
	
	// 멤버 승인 여부
	private String memberCheckStatus;
	
	// 멤버 상태(탈퇴관련)
	private String memberStatus;
	
	// 멤버 가입 유형
	private String memberSubType;
	
	// 멤버 역할
	private String memberRole;

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberBirthday() {
		return memberBirthday;
	}

	public void setMemberBirthday(String memberBirthday) {
		this.memberBirthday = memberBirthday;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberStreetAddress() {
		return memberStreetAddress;
	}

	public void setMemberStreetAddress(String memberStreetAddress) {
		this.memberStreetAddress = memberStreetAddress;
	}

	public String getMemberDetailAddress() {
		return memberDetailAddress;
	}

	public void setMemberDetailAddress(String memberDetailAddress) {
		this.memberDetailAddress = memberDetailAddress;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public Date getMemberEnrollDate() {
		return memberEnrollDate;
	}

	public void setMemberEnrollDate(Date memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}

	public String getMemberCheckStatus() {
		return memberCheckStatus;
	}

	public void setMemberCheckStatus(String memberCheckStatus) {
		this.memberCheckStatus = memberCheckStatus;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getMemberSubType() {
		return memberSubType;
	}

	public void setMemberSubType(String memberSubType) {
		this.memberSubType = memberSubType;
	}

	public String getMemberRole() {
		return memberRole;
	}

	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}

	@Override
	public String toString() {
		return "MemberVO [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", memberBirthday=" + memberBirthday + ", memberGender=" + memberGender
				+ ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail + ", memberAddress=" + memberAddress
				+ ", memberStreetAddress=" + memberStreetAddress + ", memberDetailAddress=" + memberDetailAddress
				+ ", memberNickname=" + memberNickname + ", memberEnrollDate=" + memberEnrollDate
				+ ", memberCheckStatus=" + memberCheckStatus + ", memberStatus=" + memberStatus + ", memberSubType="
				+ memberSubType + ", memberRole=" + memberRole + "]";
	}


}
