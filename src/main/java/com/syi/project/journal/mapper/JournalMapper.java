package com.syi.project.journal.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.syi.project.journal.model.Criteria;
import com.syi.project.journal.model.JournalVO;

@Mapper
public interface JournalMapper {

	// 일지 등록
	public void journalEnroll(JournalVO journal);

	// 일지 목록 List<>
	public List<JournalVO> journalGetList(Criteria cri);

	// 일지 총 수
	public int journalGetTotal(Criteria cri);

	// 일지 상세
	public JournalVO journalGetDetail(int journalNo);

	// 일지 수정
	public int journalModify(JournalVO journal);

	// 일지 삭제
	public int journalDelete(int journalNo);

	
}