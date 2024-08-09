package com.syi.project.service.journal;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.syi.project.model.Criteria;
import com.syi.project.model.journal.JournalVO;

public interface JournalService {

    /* 일지 등록 */
    public void journalEnroll(JournalVO journal, MultipartFile file) throws Exception;
    
    /* 일지 목록 */
    List<JournalVO> journalList() throws Exception;
    
    /* 일지 총 갯수 */
    int journalGetTotal(Criteria cri) throws Exception;

}
