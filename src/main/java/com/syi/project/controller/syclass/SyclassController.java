package com.syi.project.controller.syclass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.syi.project.model.syclass.SyclassVO;
import com.syi.project.service.syclass.SyclassService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/admin")
@Log4j2
public class SyclassController {
	
	@Autowired
	SyclassService syclassService;
	
	/* 반 등록 페이지 이동 */
	@GetMapping("/class/enroll")
	public void classEnrollGET() throws Exception{
		log.info("반 등록 페이지 이동");
	}
	
	/* 반 등록하기 */
	@PostMapping("/class/enroll")
	public String classEnrollPOST(SyclassVO syclass, RedirectAttributes rttr) throws Exception{
		log.info("반 등록하기 시작");
		String result;
		
		if (syclassService.classEnroll(syclass) > 0) {
			result = "success";
		} else result = "fail";
		
		rttr.addFlashAttribute("enroll_result", result);
		
		return "redirect:/admin/class/enroll";
	}

}
