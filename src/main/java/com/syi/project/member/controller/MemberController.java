package com.syi.project.member.controller;

import javax.servlet.http.HttpServletRequest;

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

import com.syi.project.member.model.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/*
	 * @Autowired private BCryptPasswordEncoder pwEncoder;
	 */
	
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
	
	// 로그인 기능
	@PostMapping("login")
	public void loginPost(HttpServletRequest request, MemberVO requestMember, RedirectAttributes rttr) {
		
		
		
		
	}
 	

}
