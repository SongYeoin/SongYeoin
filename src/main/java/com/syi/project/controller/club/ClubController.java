package com.syi.project.controller.club;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.syi.project.service.club.ClubService;

@Controller
@RequestMapping("/club/*")
public class ClubController {

	private static final Logger log = LoggerFactory.getLogger(ClubController.class);
	
	@Autowired
	private ClubService cservice;
	
	//조회페이지
	@GetMapping("/member")
	public void clubListGET(Model model) {
		log.info("목록 페이지 진입");
		model.addAttribute("list", cservice.getList());
	}
}
