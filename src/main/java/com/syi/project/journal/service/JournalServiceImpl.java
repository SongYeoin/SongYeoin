package com.syi.project.journal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syi.project.journal.mapper.JournalMapper;
import com.syi.project.journal.model.JournalVO;

@Service
public class JournalServiceImpl implements JournalService{

	@Autowired
	JournalMapper journalMapper;

	@Override
	public void journalEnroll(JournalVO journal) throws Exception {
		journalMapper.journalEnroll(journal);
	}
	
	
}
