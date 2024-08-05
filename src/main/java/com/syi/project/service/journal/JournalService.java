package com.syi.project.service.journal;

import com.syi.project.model.journal.JournalVO;

public interface JournalService {

	// 일지 등록
	public void journalEnroll(JournalVO journal) throws Exception;
	
	
}
