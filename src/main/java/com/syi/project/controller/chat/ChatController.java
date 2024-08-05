package com.syi.project.controller.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.syi.project.model.chat.ChatRoomVO;
import com.syi.project.service.chat.ChatService;

@Controller
@RequestMapping("/chatroom")
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	private ChatService chatService;

	
//	chatRoom 입장(채팅방 화면 보여주기)
	@GetMapping("/main")
	public void chatRoomGET(HttpServletRequest request, Model model) {
		logger.info("chatRoomGET() 진입....");
		
		
		HttpSession session = request.getSession();
		int chatRoomMemberNo = (int) session.getAttribute("memberNo");
		
		
		List<ChatRoomVO> chatRoomList = chatService.selectChatRoomList(chatRoomMemberNo);
		model.addAttribute("chatRoomList", chatRoomList);
	}
	
	//채팅방 개설
	@PostMapping("/create")
	public String createChatRoomPost(HttpServletRequest request,ChatRoomVO chatRoom,RedirectAttributes rttr) {
		logger.info("createChatRoomPost() 진입....");
		
		HttpSession session = request.getSession();
		//수강생 번호
		int chatRoomMemberNo = (int) session.getAttribute("memberNo");
		chatRoom.setChatRoomMemberNo(chatRoomMemberNo);
		
		//관리자(담당자 번호) 구해오기
		/* int chatRoomAdminNo = chatService.selectAdminNoByClassNo(); */
		
		// 담당자와 수강생은 같음, but, 반이 다름 => charRoomNo도 다름
		// 담당자 번호로 조회해와서 객체에 값이 담겨있다면 이미 있는 채팅방
		// 아니라면(null) 생성하기
		//if(chatRoom.getChatRoomAdminNo())
		
		
		chatService.insertChatRoom(chatRoom);
		
		return "redirect:/chatroom/main";
	}
	
	

	

}
