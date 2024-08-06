package com.syi.project.service.journal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.syi.project.mapper.journal.JournalFileMapper;
import com.syi.project.mapper.journal.JournalMapper;
import com.syi.project.model.journal.JournalFileVO;
import com.syi.project.model.journal.JournalVO;

@Service
public class JournalServiceImpl implements JournalService {

	@Autowired
	private JournalMapper journalMapper;

	@Autowired
	private JournalFileMapper journalFileMapper;

	@Override
	@Transactional
	public void journalEnroll(JournalVO journal, List<JournalFileVO> journalFile) throws Exception {
		journalMapper.journalEnroll(journal);

		// Insert associated files
		for (JournalFileVO file : journalFile) {
			file.setJournalNo(journal.getJournalNo());
			journalFileMapper.journalFileEnroll(file);
		}

	}

	@Override
	@Transactional
	public void saveJournalFiles(List<JournalFileVO> journalFiles) throws Exception {
		for (JournalFileVO file : journalFiles) {
			journalFileMapper.journalFileEnroll(file);
		}
	}

}
