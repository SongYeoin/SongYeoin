package com.syi.project.mapper.club;

import java.util.List;

import com.syi.project.model.club.ClubVO;

public interface ClubMapper {

	
	//동아리 조회
	public List<ClubVO> getList();
	
	//동아리 등록
	public void enroll(ClubVO club);

	
}
