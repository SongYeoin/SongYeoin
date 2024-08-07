package com.syi.project.service.journal;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.syi.project.model.journal.JournalFileVO;
import com.syi.project.model.journal.JournalVO;

public interface JournalService {

	// 일지 등록
	public void journalEnroll(JournalVO journal, List<JournalFileVO> files) throws Exception;
	JournalVO getJournalById(Integer journalNo);
    JournalFileVO getJournalFileById(Integer fileNo);

	

}
