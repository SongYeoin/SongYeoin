package com.syi.project.model;

import com.syi.project.model.member.MemberVO;

import lombok.Data;

@Data
public class EnrollVO {

	private int enrollNo;
	private int classNo;
	private MemberVO member;
}
