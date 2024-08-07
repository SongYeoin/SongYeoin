package com.syi.project.service.journal;

import java.util.List;

import com.syi.project.model.journal.JournalFileVO;
import com.syi.project.model.journal.JournalVO;

public interface JournalService {

    /**
     * 일지와 관련된 파일을 데이터베이스에 등록합니다.
     * 
     * @param journal 등록할 일지 정보가 담긴 객체입니다.
     * @param files 등록할 파일의 리스트입니다. 각 파일은 JournalFileVO 객체로 표현됩니다.
     * 
     * 이 메서드는 일지 정보를 데이터베이스에 저장하고, 
     * 관련된 파일 정보를 별도로 저장하는 작업을 수행합니다. 
     * 파일의 저장 정보는 `JournalFileVO` 객체를 통해 데이터베이스에 추가됩니다.
     */
    public void addJournalWithFiles(JournalVO journal, List<JournalFileVO> files);

}
