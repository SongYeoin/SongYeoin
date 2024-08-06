package com.syi.project.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syi.project.mapper.member.AdminMapper;
import com.syi.project.model.member.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper adminMapper;

	// 로그인
	@Override
	public MemberVO selectLoginAdmin(MemberVO member) {
		return adminMapper.selectLoginAdmin(member);
	}
}
