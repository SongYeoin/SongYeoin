package com.syi.project.controller.journal;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.syi.project.model.journal.JournalFileVO;
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

    /**
     * 일지 등록을 처리하는 POST 요청을 처리합니다.
     * 업로드된 파일을 서버에 저장하고, 일지와 파일 정보를 데이터베이스에 추가합니다.
     * 
     * @param journal 등록할 일지 정보
     * @param files 업로드된 파일 리스트
     * @param model Spring MVC의 Model 객체
     * @return 리디렉션할 URL
     * @throws IOException 파일 업로드 처리 중 발생할 수 있는 예외
     */
    @PostMapping("/journalEnroll.do")
    public String journalEnrollPOST(JournalVO journal, @RequestParam("files") List<MultipartFile> files, Model model)
            throws IOException {

        // 메서드 호출을 로그에 기록
        logger.info(">>>>>>>>>>>>>>>>>>   journalEnrollPOST method called ");

        // 파일 업로드를 위한 디렉토리 경로 설정
        String uploadDir = System.getProperty("user.dir") + File.separator + "upload";
        File uploadDirFile = new File(uploadDir);

        // 디렉토리가 존재하지 않으면 생성
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs(); // 디렉토리 생성
            logger.info(">>>>>>>>>>    Upload directory created at: " + uploadDir);

        } else {
            logger.info(">>>>>>>>>>    Upload directory already exists at: " + uploadDir);
        }

        // 파일 리스트를 저장할 리스트 생성
        List<JournalFileVO> fileList = new ArrayList<>();

        // 업로드된 파일 처리
        for (MultipartFile file : files) {
            logger.info(">>>>>>>>>>         Processing file: " + file.getOriginalFilename());

            // 파일이 비어 있지 않은 경우에만 처리
            if (!file.isEmpty()) {
                try {
                    // 파일 저장 경로 설정
                    String originalName = file.getOriginalFilename();
                    String savedName = System.currentTimeMillis() + "_" + originalName;
                    File destinationFile = new File(uploadDir + File.separator + savedName);
                    logger.info(">>>>>>>>>>        Saving file to: " + destinationFile.getAbsolutePath());
                    
                    // 파일을 지정된 경로에 저장
                    file.transferTo(destinationFile);

                    // JournalFileVO 객체 생성 및 정보 설정
                    JournalFileVO journalFile = new JournalFileVO();
                    journalFile.setFileOriginalName(originalName);
                    journalFile.setFileSavedName(savedName);
                    journalFile.setFileType(file.getContentType());
                    journalFile.setFileSize((int) file.getSize());
                    journalFile.setFilePath(destinationFile.getAbsolutePath());

                    // 파일 리스트에 추가
                    fileList.add(journalFile);
                    logger.info(">>>>>>>>>>>>            File saved successfully: " + originalName);

                } catch (IOException e) {
                    // 파일 저장 중 발생한 오류를 로그에 기록
                    logger.error(">>>>>>>>>          Error saving file", e);
                }
            } else {
                logger.info(">>>>>>>>>>>>           Empty file detected: " + file.getOriginalFilename());
            }
        }

        // 일지와 파일을 데이터베이스에 추가
        try {
            // 서비스 메서드를 호출하기 전 로그에 기록
            logger.info(">>>>>>>>>>>>                Attempting to add journal with files to database");

            // 서비스 호출
            journalService.addJournalWithFiles(journal, fileList);

            // 성공적으로 추가된 후 로그에 기록
            logger.info(">>>>>>>>>>>>                Successfully added journal with files to database");

        } catch (Exception e) {
            // 데이터베이스 추가 중 발생한 오류를 로그에 기록
            logger.error(">>>>>>>>>>>>                Error adding journal with files to database", e);
        }

        // 일지 목록 페이지로 리디렉션
        return "redirect:/journalList";
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
