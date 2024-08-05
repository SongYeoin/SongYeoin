package com.syi.project.service.syclass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syi.project.mapper.syclass.SyclassMapper;
import com.syi.project.model.syclass.SyclassVO;

@Service
public class SyclassService {
	
	@Autowired
	SyclassMapper syclassMapper;

	/* 반 등록하기 */
	public int classEnroll(SyclassVO syclass) {
		return syclassMapper.classEnroll(syclass);
	}

}
