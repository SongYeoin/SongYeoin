package com.syi.project.member.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.syi.project.member.mapper.MemberMapper;
import com.syi.project.member.model.MemberVO;

public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper memberMapper;

	// 로그인
	@Override
	public MemberVO selectLoginMember(MemberVO member) {
		return memberMapper.selectLoginMember(member);
	}

}
