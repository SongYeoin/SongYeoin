package com.syi.project.service.journal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syi.project.mapper.journal.JournalMapper;
import com.syi.project.model.journal.JournalVO;

@Service
public class JournalServiceImpl implements JournalService{

	@Autowired
	JournalMapper journalMapper;

	@Override
	public void journalEnroll(JournalVO journal) throws Exception {
		journalMapper.journalEnroll(journal);
	}
	
	
}
