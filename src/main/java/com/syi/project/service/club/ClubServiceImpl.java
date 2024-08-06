package com.syi.project.service.club;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syi.project.mapper.club.ClubMapper;
import com.syi.project.model.club.ClubVO;

@Service
public class ClubServiceImpl implements ClubService{

	@Autowired
	private ClubMapper mapper;
	
	@Override
	public List<ClubVO> getList() {
		return mapper.getList();
	}
	
	

}
