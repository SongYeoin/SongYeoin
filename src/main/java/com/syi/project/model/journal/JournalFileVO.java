package com.syi.project.model.journal;

import java.util.Date;

import lombok.Data;

@Data
public class JournalFileVO {
	
	private Integer fileNo; // 파일 고유번호
	
	private String fileOriginalName; // 파일 원본 이름
	
	private String fileSavedName; // 파일 저장 이름
	
	private String fileType; // 파일 유형?
	
	private Integer fileSize; // 파일 크기
	
	private String filePath; // 파일 경로
	
	private Date fileRegDate; // 파일 등록 날짜
	
	private Integer journalNo; // 일지 번호

	
	
}