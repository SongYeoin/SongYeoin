package com.syi.project.mapper.journal;


import org.apache.ibatis.annotations.Mapper;

import com.syi.project.model.journal.JournalFileVO;

@Mapper
public interface JournalFileMapper {

	public void journalFileEnroll(JournalFileVO journalFile);
	


	
}
