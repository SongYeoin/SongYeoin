package com.syi.project.controller.journal;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.syi.project.model.journal.JournalFileVO;
import com.syi.project.model.journal.JournalVO;
import com.syi.project.service.journal.JournalService;

// @Controller : 요청 처리하고 뷰를 반환한다
// @RequestMapping : 이 컨트롤러 내의 모든 요청 url은 /journal 로 시작한다
@Controller
@RequestMapping("/journal")
public class JournalController {

	// 로그 기록을 위한 객체 (실행 흐름과 디버깅에 유용)
	private static final Logger logger = LoggerFactory.getLogger(JournalController.class);

	// @Autowired : JournalService 객체(비즈니스 로직 처리) 를 자동 주입한다
	@Autowired
	private JournalService journalService;

	/* 일지 메인 페이지 접속 */
	// @GetMapping : get 요청 처리. url '/journal/journalMain' 일때 호출
	@GetMapping("journalMain")
	public void journalMainGET() {
		logger.info("교육일지 메인 페이지 접속");
	}

	/* 일지 등록 페이지 접속 */
	@GetMapping("/new")
    public String showForm() {
		logger.info("교육일지 등록 폼 접속");
        return "journalForm"; // jsp 경로
    }

	/* 일지 등록 */
	@PostMapping("/save")
    public String saveJournal(@ModelAttribute JournalVO journal,
                              @RequestParam("files") MultipartFile[] files,
                              HttpServletRequest request,
                              RedirectAttributes redirectAttributes) {
        try {
            List<JournalFileVO> journalFiles = new ArrayList<>();
            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                    String originalFileName = file.getOriginalFilename();
                    String savedFileName = System.currentTimeMillis() + "_" + originalFileName;
                    String filePath = request.getServletContext().getRealPath("/") + "uploads/" + savedFileName;
                    
                    File destinationFile = new File(filePath);
                    file.transferTo(destinationFile);

                    JournalFileVO journalFile = new JournalFileVO();
                    journalFile.setFileOriginalName(originalFileName);
                    journalFile.setFileSavedName(savedFileName);
                    journalFile.setFileType(file.getContentType());
                    journalFile.setFileSize((int) file.getSize());
                    journalFile.setFilePath(filePath);
                    journalFiles.add(journalFile);
                }
            }
            journalService.journalEnroll(journal, journalFiles);
            redirectAttributes.addFlashAttribute("message", "Journal and files saved successfully.");
        } catch (IOException | Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "An error occurred.");
        }
        return "redirect:/journal/new";
    }

    @GetMapping("/view/{journalNo}")
    public String viewJournal(@PathVariable Integer journalNo, Model model) {
        JournalVO journal = journalService.getJournalById(journalNo);
        model.addAttribute("journal", journal);
        return "journalView";
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
