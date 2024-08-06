package com.syi.project.mapper.member;

import java.util.List;

import com.syi.project.model.Criteria;
import com.syi.project.model.member.MemberVO;

public interface AdminMapper {
	
	// 로그인
	MemberVO selectLoginAdmin(MemberVO member);
	
	// 수강생 리스트 조회
	List<MemberVO> selectMemberList(Criteria cri); 
	
	// 수강생 
	int selectTotalCount();
}
