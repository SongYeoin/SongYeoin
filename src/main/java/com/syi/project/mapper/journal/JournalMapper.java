package com.syi.project.mapper.journal;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.syi.project.model.Criteria;
import com.syi.project.model.journal.JournalFileVO;
import com.syi.project.model.journal.JournalVO;

@Mapper
public interface JournalMapper {

	// 일지 등록
	public void journalEnroll(JournalVO journal);
	
	// 파일 정보 저장
    public void journalFileEnroll(JournalFileVO journalFile);
    
    JournalVO selectJournalById(@Param("journalNo") Integer journalNo);

    JournalFileVO selectJournalFileById(@Param("fileNo") Integer fileNo);
    
    
	// 일지 목록 List<>
	public List<JournalVO> journalList(Criteria cri);

	// 일지 총 수
	public int journalGetTotal(Criteria cri);

	// 일지 상세
	public JournalVO journalDetail(int journalNo);

	// 일지 수정
	public int journalModify(JournalVO journal);

	// 일지 삭제
	public int journalDelete(int journalNo);

	
}