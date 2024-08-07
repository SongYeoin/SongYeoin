package com.syi.project.service.journal;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.syi.project.mapper.journal.JournalFileMapper;
import com.syi.project.mapper.journal.JournalMapper;
import com.syi.project.model.journal.JournalFileVO;
import com.syi.project.model.journal.JournalVO;

/**
 * JournalServiceImpl 클래스는 JournalService 인터페이스를 구현합니다.
 * 이 클래스는 일지를 데이터베이스에 추가하고, 관련 파일을 삽입하는 비즈니스 로직을 담당합니다.
 */
@Service
public class JournalServiceImpl implements JournalService {

    // 로그를 기록하기 위한 SLF4J Logger 객체
    private static final Logger logger = LoggerFactory.getLogger(JournalServiceImpl.class);

    // 의존성 주입을 위한 JournalMapper 객체
    @Autowired
    private JournalMapper journalMapper;

    // 의존성 주입을 위한 JournalFileMapper 객체
    @Autowired
    private JournalFileMapper journalFileMapper;

    /**
     * 새로운 일지와 관련 파일들을 데이터베이스에 추가하는 메서드입니다.
     * 이 메서드는 트랜잭션을 지원하며, 일지와 파일을 모두 삽입합니다.
     * 
     * @param journal 추가할 JournalVO 객체
     * @param files 추가할 JournalFileVO 객체의 리스트
     */
    @Transactional
    @Override
    public void addJournalWithFiles(JournalVO journal, List<JournalFileVO> files) {
        
        // 일지를 삽입하기 전의 상태를 로그에 기록
        logger.info(">>>>>>>>>>>>>>>>>>> Journal before insert: " + journal);
        
        // 일지를 데이터베이스에 삽입
        journalMapper.journalEnroll(journal);
        
        // 일지 삽입 후의 상태를 로그에 기록
        logger.info(">>>>>>>>>>>>>>>>>>> Journal after insert: " + journal);
        
        // 각 파일의 journalNo 속성을 설정하고 파일을 데이터베이스에 삽입
        for (JournalFileVO file : files) {
            file.setJournalNo(journal.getJournalNo());
            journalFileMapper.insertJournalFile(file);
        }
        
        // 일지 삽입 후 자동 생성된 ID를 로그에 기록
        logger.info("Files associated with Journal No: " + journal.getJournalNo());
    }
}
