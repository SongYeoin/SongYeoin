package com.syi.project.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.syi.project.member.model.MemberVO;
import com.syi.project.member.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	 

	// 로그인 페이지 이동
	@GetMapping("login")
	public void loginGet() {
		logger.info("로그인 페이지 이동");
	}

	// 회원가입 페이지 이동
	@GetMapping("join")
	public void joinGet() {
		logger.info("회원가입 페이지 이동");
	}
	
	// 마이페이지 이동
	@GetMapping("mypage")
	public void mypageGet() {
		logger.info("마이페이지 이동");
	}

	// 아이디 중복 체크

	// 회원가입

	// 로그인
	@PostMapping("login")
	public String loginPost(HttpServletRequest request, MemberVO requestMember, RedirectAttributes rttr) throws Exception {

		MemberVO loginMember = memberService.selectLoginMember(requestMember);

		// 사용자 존재하지 않음
		if (loginMember == null) {
			rttr.addFlashAttribute("result", 1);
			return "redirect:/member/login";
		}

		// 비밀번호 불일치
		if (!pwdEncoder.matches(requestMember.getMemberPwd(), loginMember.getMemberPwd())) {
			rttr.addFlashAttribute("result", 1);
			return "redirect:/member/login";
		}
		

		// 미승인 회원
		if ("N".equals(loginMember.getMemberCheckStatus())) {
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/login";
		}

		// 로그인 성공
		loginMember.setMemberPwd("");
		HttpSession session = request.getSession();
		session.setAttribute("loginMember", loginMember);
		return "redirect:/member/main";
	}

	// 마이페이지
	@PostMapping("mypage")
	public String mypageMember() {
		return "redirect:/member/mypage";
	}

	// 로그아웃
	@PostMapping("logout")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 회원탈퇴
	@PostMapping("delete")
	public void deleteMember() {
	}

}
