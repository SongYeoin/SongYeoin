package com.syi.project.mapper.journal;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.syi.project.model.Criteria;
import com.syi.project.model.journal.JournalVO;

@Mapper
public interface JournalMapper {

	// 일지 등록
	public void journalEnroll(JournalVO journal);
    
	// 일지 목록 List<>
	List<JournalVO> journalList();

	// 일지 총 갯수
	int journalGetTotal(Criteria cri);

	// 일지 상세
	public JournalVO journalDetail(int journalNo);

	// 일지 수정
	int journalModify(JournalVO journal);

	// 일지 삭제
	int journalDelete(int journalNo);

	
}