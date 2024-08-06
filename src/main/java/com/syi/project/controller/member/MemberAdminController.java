package com.syi.project.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.syi.project.model.Criteria;
import com.syi.project.model.member.MemberVO;
import com.syi.project.service.member.AdminService;

@Controller
@RequestMapping(value = "/admin")
public class MemberAdminController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private AdminService adminService;

	@Autowired
	private BCryptPasswordEncoder pwdEncoder;

	// 관리자 로그인 페이지 이동
	@GetMapping("login")
	public void loginGet() {
		logger.info("관리자 로그인 페이지 이동");
	}
	
	// 관리자 로그인
	@PostMapping("login")
	public String loginPost(HttpServletRequest request, MemberVO requestMember, RedirectAttributes rttr)
			throws Exception {
		

		MemberVO loginMember = adminService.selectLoginAdmin(requestMember);

		// 사용자 존재하지 않음
		if (loginMember == null) {
			rttr.addFlashAttribute("result", 1);
			return "redirect:/admin/login";
		}

		// 비밀번호 불일치
		if (!pwdEncoder.matches(requestMember.getMemberPwd(), loginMember.getMemberPwd())) {
			rttr.addFlashAttribute("result", 1);
			return "redirect:/admin/login";
		}

		// 미승인 회원
		if (!"Y".equals(loginMember.getMemberCheckStatus())) {
			rttr.addFlashAttribute("result", 0);
			return "redirect:/admin/login";
		}

		// 로그인 성공
		loginMember.setMemberPwd("");
		HttpSession session = request.getSession();
		session.setAttribute("loginMember", loginMember);
		return "redirect:/admin/main";
	}
	
	// 관리자 수강생 조회 페이지
	@GetMapping("member/list")
	public String memberListGet(Criteria cri, Model model) throws Exception {
		logger.info("관리자 수강 조회 페이지 접속");
		
		return "redirect:/admin/member/list";
	}
	
	


}
