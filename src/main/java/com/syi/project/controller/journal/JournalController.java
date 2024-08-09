package com.syi.project.controller.journal;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
	
	// 파일 업로드 경로를 저장할 필드
	@Value("${file.upload.path}")
    private String fileUploadPath;

	@GetMapping("journalMain")
	public void journalMainGET() {
		logger.info("교육일지 메인 페이지 접속");
	}

	/* 일지 등록 페이지로 이동 */
	@GetMapping("journalEnroll")
	public String journalEnrollGET() {
		logger.info("일지 등록 폼 페이지 접속");
		return "journal/journalEnroll";
	}

	/* 일지 등록 */
	@PostMapping("/journalEnroll.do")
	public String addJournal(JournalVO journal, @RequestParam("file") MultipartFile file) throws Exception {
	    
		// 파일 업로드 처리
	    if (!file.isEmpty()) {
	        // 파일 이름 정리 (파일의 불필요한 경로, 요소를 제거하고 이름만 남겨놓음)
	        String fileName = StringUtils.cleanPath(file.getOriginalFilename());
	        // 파일이 저장될 경로 설정
	        Path uploadPath = Paths.get(fileUploadPath);

	        logger.info(">>> File upload path: {}", uploadPath);

	        // 업로드 경로가 존재하지 않으면 생성
	        if (!Files.exists(uploadPath)) {
	            logger.info(">>> Creating directory: {}", uploadPath);
	            Files.createDirectories(uploadPath);
	        }

	        // 파일 저장 경로 설정
	        Path filePath = uploadPath.resolve(fileName);
	        logger.info(">>> File path: {}", filePath);

	        try {
	            // 파일 저장
	            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
	            journal.setFileName(fileName); // 일지에 파일 이름 설정
	            logger.info(">>> File uploaded successfully: {}", fileName);
	        } catch (IOException e) {
	            logger.error(">>> File upload failed: {}", fileName, e);
	            throw new Exception("파일 업로드 실패: " + fileName, e);
	        }
	    }

	    // 일지 등록 처리
	    logger.info(">>> Received journal date: {}", journal.getJournalWriteDate());
	    journalService.journalEnroll(journal, file);
	    return "redirect:/journal/journalList";
	}

	/* 첨부파일 다운로드 */
	@GetMapping("/downloadFile")
	public ResponseEntity<InputStreamResource> downloadFile(@RequestParam("fileName") String fileName) {
	    try {
	        // 파일 이름 정리(불필요한 경로 구분기호 제거하고 이름만 남기기)
	        String cleanedFileName = StringUtils.cleanPath(fileName);
	        // 파일 객체 생성(최종적인 파일 경로를 생성함 (파일 저장할 경로 + 정리된 파일 이름)
	        File file = new File(fileUploadPath, cleanedFileName);

	        // 파일이 존재하지 않으면 404 에러 반환
	        if (!file.exists()) {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
	        }

	        // 파일 입력 스트림 생성
	        InputStream inputStream = new FileInputStream(file);

	        // HTTP 헤더 설정 (파일 다운로드를 위한 설정)
	        HttpHeaders headers = new HttpHeaders();
	        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + URLEncoder.encode(cleanedFileName, "UTF-8"));

	        // 파일 스트림을 ResponseEntity로 반환
	        InputStreamResource resource = new InputStreamResource(inputStream);
	        return ResponseEntity.ok()
	                .headers(headers)
	                .body(resource);
	    } catch (IOException e) {
	        // 서버 에러 시 500 에러 반환
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	    }
	}

	
	/* 교육일지 목록 조회 페이지 */
	@GetMapping("journalList")
	public String journalListGET(Model model) throws Exception {
		logger.info(">>>>>>>>>>       교육일지 목록 페이지 접속             >>>>>>>>>>");
		
		
		/* 일지 리스트 데이터 */
		List<JournalVO> journalList = journalService.journalList();
		
		// 일지 리스트가 비어있지 않은 경우 로그를 찍습니다.
	    if (journalList != null && !journalList.isEmpty()) {
	        for (JournalVO journal : journalList) {
	            logger.info(">>>>>>>>>>>                Journal: {}", journal);
	        }
	    } else {
	        logger.info(">>>>>>>>>>>>>>                    No journals found.");
	    }
		
		model.addAttribute("journalList", journalList); // 일지 존재할 경우

		return "journal/journalList";
		
	}

	/* 교육일지 상세 정보 페이지 */
	@GetMapping("journalDetail")
	public void journalDetailGET(@RequestParam("journalNo") int journalNo, Model model) throws Exception {
		logger.info("교육일지 상세 페이지 접속 / 일지 글번호 ---> " + journalNo);
		
		JournalVO journal = journalService.journalDetail(journalNo);
		
		model.addAttribute("journalDetail", journal);
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
