package com.syi.project.member.service;

import com.syi.project.member.model.MemberVO;

public interface MemberService {
	
	// 로그인
	public MemberVO selectLoginMember(MemberVO member); 

}
