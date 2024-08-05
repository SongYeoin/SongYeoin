package com.syi.project.controller.journal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.syi.project.service.journal.JournalService;

@Controller
@RequestMapping("/journal")
public class JournalController {

	private static final Logger logger = LoggerFactory.getLogger(JournalController.class);

	@Autowired
	private JournalService journalService;
	
	/* 일지 메인 페이지 접속 */
	@GetMapping("/journalMain")
	public void journalMainGET() throws Exception{
		logger.info("일지 메인 페이지 접속");
	}

	
	/* 일지 등록 페이지 접속 */
	@RequestMapping(value = "journalEnroll", method = RequestMethod.GET)
	public String journalEnrollGET() throws Exception {
        logger.info("교육일지 등록 페이지 접속");
        return "journal/journalEnroll"; // view 이름 반환 (jsp 경로)
    }
	
	
}