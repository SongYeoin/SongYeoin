package com.syi.project.controller.journal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	@GetMapping("journalMain")
	public void journalMainGET() {
		logger.info("교육일지 메인 페이지 접속");
	}

	/* 일지 등록 페이지 접속 */
	@RequestMapping(value = "journalEnroll", method = RequestMethod.GET)
	public String journalEnrollGET() throws Exception {
		logger.info("교육일지 등록 페이지 접속");
		return "journal/journalEnroll"; // view 이름 반환 (jsp 경로)
	}
	
	/* 일지 목록 페이지 접속 */
	@RequestMapping(value = "journalList", method = RequestMethod.GET)
	public String journalListGET() throws Exception {
		logger.info("교육일지 목록 페이지 접속");
		return "journal/journalList"; // view 이름 반환 (jsp 경로)
	}
	
	/* 일지 상세 페이지 접속 */
	@RequestMapping(value = "journalDetail", method = RequestMethod.GET)
	public String journalDetailGET() throws Exception {
		logger.info("교육일지 상세 페이지 접속");
		return "journal/journalDetail"; // view 이름 반환 (jsp 경로)
	}
	
	/* 일지 수정 페이지 접속 */
	@RequestMapping(value = "journalModify", method = RequestMethod.GET)
	public String journalModifylGET() throws Exception {
		logger.info("교육일지 수정 페이지 접속");
		return "journal/journalModify"; // view 이름 반환 (jsp 경로)
	}
	
	/* 교육일정 관리 페이지 접속 */
    @PostMapping("eduScheduleManage")
    public String eduScheduleManagePOST() {
        logger.info("교육일정 관리 페이지 접속");
        return "journal/eduScheduleManage"; // view 이름 반환 (jsp 경로)
    }

    /* 교육일정 관리 페이지 접근을 위해 GET 요청 처리 */
    @GetMapping("eduScheduleManage")
    public String eduScheduleManageGET() {
        logger.info("교육일정 관리 페이지 GET 요청");
        return "redirect:/journal/eduScheduleManage"; // POST 요청을 처리하는 페이지로 리디렉션
    }
	
	
	

}