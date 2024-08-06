package com.syi.project.service.journal;


import java.util.List;

import com.syi.project.model.journal.JournalFileVO;
import com.syi.project.model.journal.JournalVO;

public interface JournalService {

	// 일지 등록
	public void journalEnroll(JournalVO journal, List<JournalFileVO> journalFile) throws Exception;
	
    public void saveJournalFiles(List<JournalFileVO> journalFiles) throws Exception;

	

}
