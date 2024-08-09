package com.syi.project.service.journal;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.syi.project.mapper.journal.JournalMapper;
import com.syi.project.model.Criteria;
import com.syi.project.model.journal.JournalVO;

/* 일지를 데이터베이스에 추가하고, 관련 파일을 삽입하는 비즈니스 로직을 담당 */
@Service
public class JournalServiceImpl implements JournalService {

	// 로그를 기록하기 위한 SLF4J Logger 객체
	private static final Logger logger = LoggerFactory.getLogger(JournalServiceImpl.class);

	// 의존성 주입을 위한 JournalMapper 객체
	@Autowired
	private JournalMapper journalMapper;
	

	@Value("${file.upload.path}")
	private String fileUploadPath;

	// 일지 등록
	@Override
	public void journalEnroll(JournalVO journal, MultipartFile file) throws Exception {
		if (!file.isEmpty()) {
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			Path uploadPath = Paths.get(fileUploadPath);

			logger.info(">>>>>>>>>>>>>>>>>               File upload path: {}", uploadPath);

			if (!Files.exists(uploadPath)) {
				logger.info(">>>>>>>>>>>>>>>>>              Creating directory: {}", uploadPath);
				Files.createDirectories(uploadPath);
			}

			Path filePath = uploadPath.resolve(fileName);
			logger.info(">>>>>>>>>>>>>>>>>               File path: {}", filePath);

			try {
				Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
				journal.setFileName(fileName);
				logger.info(">>>>>>>>>>>>>>>>>               File uploaded successfully: {}", fileName);
			} catch (IOException e) {
				logger.error(">>>>>>>>>>>>>>>>>               File upload failed: {}", fileName, e);
				throw new Exception(">>>>>>>>>>>>>>>>>               파일 업로드 실패: " + fileName, e);
			}
		}
		
		
		logger.info("작성일자 확인 ---------- Journal date in service: {}", journal.getJournalWriteDate());
	    // 날짜가 null이 아닌지 확인하고 처리
		if (journal.getJournalWriteDate() == null) {
	        throw new Exception("Journal date cannot be null");
	    }
		
		journalMapper.journalEnroll(journal);

	}

	// 일지 조회
	@Override
	public List<JournalVO> journalList() throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>               journalList  >>");
		return journalMapper.journalList();
	}

	// 일지 갯수
	@Override
	public int journalGetTotal(Criteria cri) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>               journalGetTotal  >>");
		return journalMapper.journalGetTotal(cri);
	}

	
	
}
