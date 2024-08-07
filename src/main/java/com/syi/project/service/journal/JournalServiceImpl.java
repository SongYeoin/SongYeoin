package com.syi.project.service.journal;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.syi.project.mapper.journal.JournalMapper;
import com.syi.project.model.journal.JournalFileVO;
import com.syi.project.model.journal.JournalVO;

@Service
public class JournalServiceImpl implements JournalService {

	@Autowired
	private JournalMapper journalMapper;

	@Transactional
	@Override
	public void journalEnroll(JournalVO journal, List<JournalFileVO> files) throws Exception {
		journalMapper.journalEnroll(journal);
        for (JournalFileVO file : files) {
            file.setJournalNo(journal.getJournalNo());
            journalMapper.journalFileEnroll(file);
        }
		
	}

	@Override
	public JournalVO getJournalById(Integer journalNo) {
		return journalMapper.selectJournalById(journalNo);
	}

	@Override
	public JournalFileVO getJournalFileById(Integer fileNo) {
		return journalMapper.selectJournalFileById(fileNo);
	}

	

}
