package com.syi.project.service.member;

import com.syi.project.model.member.MemberVO;

public interface AdminService {

	// 로그인
	public MemberVO selectLoginAdmin(MemberVO member) throws Exception;


}
