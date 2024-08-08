package com.syi.project.service.journal;

import org.springframework.web.multipart.MultipartFile;

import com.syi.project.model.journal.JournalVO;

public interface JournalService {

    /**
     * 일지와 관련된 파일을 데이터베이스에 등록
     * 
     * journal 등록할 일지 정보가 담긴 객체 / files 등록할 파일의 리스트. 각 파일은 JournalFileVO 객체로 표현됨
     * 
     * 일지 정보를 데이터베이스에 저장, 관련된 파일 정보를 별도로 저장하는 작업 수행. 
     * 파일의 저장 정보는 `JournalFileVO` 객체를 통해 데이터베이스에 추가됨.
     */
    public void journalEnroll(JournalVO journal, MultipartFile file) throws Exception;

}
