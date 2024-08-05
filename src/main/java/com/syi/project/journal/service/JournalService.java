package com.syi.project.journal.service;

import com.syi.project.journal.model.JournalVO;

public interface JournalService {

	// 일지 등록
	public void journalEnroll(JournalVO journal) throws Exception;
	
	
}
