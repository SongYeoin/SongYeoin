package com.syi.project.controller.chat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.syi.project.service.chat.ChatService;

@Controller
@RequestMapping("/chatroom")
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	private final ChatService chatService;

	public ChatController(ChatService chatService) {
		this.chatService = chatService;
	}
	
//	chatRoom 입장(채팅방 화면 보여주기)
	@GetMapping("/main")
	public void chatRoomGET() {
		logger.info("chatRoomGET() 진입....");
	}
	
	/*
	 * 메시지를 처음 보낼시
	 * => 보냄과 동시에 채팅방이 개설
	 * 
	 * 
	 * 
	 * */
	
	

	

}
