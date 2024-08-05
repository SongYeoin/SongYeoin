package com.syi.project.mapper.member;

import com.syi.project.model.member.MemberVO;

public interface AdminMapper {
	
	// 로그인
	MemberVO selectLoginAdmin(MemberVO member);
}
