package com.syi.project.controller.journal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.syi.project.model.journal.JournalVO;
import com.syi.project.service.journal.JournalService;

@Controller
@RequestMapping("/journal")
public class JournalController {

	private static final Logger logger = LoggerFactory.getLogger(JournalController.class);

	@Autowired
	private JournalService journalService;

	@GetMapping("journalMain")
	public void journalMainGET() {
		logger.info("교육일지 메인 페이지 접속");
	}

	@GetMapping("journalEnroll")
	public String journalEnrollGET() {
		logger.info("일지 등록 폼 페이지 접속");
		return "journal/journalEnroll";
	}

	@PostMapping("/journalEnroll.do")
    public String addJournal(JournalVO journal, @RequestParam("file") MultipartFile file) throws Exception {
        journalService.journalEnroll(journal, file);
        return "redirect:/journal/journalList";
    }

	/**
	 * 교육일지 목록 페이지를 요청하는 GET 요청을 처리합니다.
	 * 
	 * @return JSP 뷰 이름
	 * @throws Exception 페이지 처리 중 발생할 수 있는 예외
	 */
	@RequestMapping(value = "journalList", method = RequestMethod.GET)
	public String journalListGET() throws Exception {
		logger.info("교육일지 목록 페이지 접속");
		return "journal/journalList"; // JSP 뷰 이름 반환
	}

	/**
	 * 교육일지 상세 페이지를 요청하는 GET 요청을 처리합니다.
	 * 
	 * @return JSP 뷰 이름
	 * @throws Exception 페이지 처리 중 발생할 수 있는 예외
	 */
	@RequestMapping(value = "journalDetail", method = RequestMethod.GET)
	public String journalDetailGET() throws Exception {
		logger.info("교육일지 상세 페이지 접속");
		return "journal/journalDetail"; // JSP 뷰 이름 반환
	}

	/**
	 * 교육일지 수정 페이지를 요청하는 GET 요청을 처리합니다.
	 * 
	 * @return JSP 뷰 이름
	 * @throws Exception 페이지 처리 중 발생할 수 있는 예외
	 */
	@RequestMapping(value = "journalModify", method = RequestMethod.GET)
	public String journalModifylGET() throws Exception {
		logger.info("교육일지 수정 페이지 접속");
		return "journal/journalModify"; // JSP 뷰 이름 반환
	}

	/**
	 * 교육일정 관리 페이지를 요청하는 POST 요청을 처리합니다.
	 * 
	 * @return JSP 뷰 이름
	 */
	@PostMapping("eduScheduleManage")
	public String eduScheduleManagePOST() {
		logger.info("교육일정 관리 페이지 접속");
		return "journal/eduScheduleManage"; // JSP 뷰 이름 반환
	}

	/**
	 * 교육일정 관리 페이지 접근을 위해 GET 요청을 처리합니다.
	 * 
	 * @return 리디렉션할 URL
	 */
	@GetMapping("eduScheduleManage")
	public String eduScheduleManageGET() {
		logger.info("교육일정 관리 페이지 GET 요청");
		return "redirect:/journal/eduScheduleManage"; // POST 요청을 처리하는 페이지로 리디렉션
	}
}
