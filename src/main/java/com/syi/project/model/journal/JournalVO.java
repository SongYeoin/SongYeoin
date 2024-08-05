package com.syi.project.model.journal;

import java.util.Date;
import java.util.List;

public class JournalVO {

	private int journalNo; // 일지 번호

	private Date journalDate; // 일지 작성일자

	private Date journalModify; // 일지 수정일자
	
	private String journalTitle; // 일지 제목
	
	private int classNo; // 반 번호

	private int memberNo; // 학생 번호

	private int fileNo; // 파일 번호
	
	private List<JournalFileVO> journalFileList; // 첨부파일 정보


}