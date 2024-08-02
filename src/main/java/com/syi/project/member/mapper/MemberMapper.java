package com.syi.project.member.mapper;

import com.syi.project.member.model.MemberVO;

public interface MemberMapper {
	
	// 로그인
	public MemberVO selectLoginMember(MemberVO member);

}
