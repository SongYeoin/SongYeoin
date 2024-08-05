package com.syi.project.service.chat;

import java.util.List;

import com.syi.project.model.chat.ChatRoomVO;

public interface ChatService {

	public List<ChatRoomVO> getChatRoomList(ChatRoomVO chatRoom);
	
	public void insertChatRoom(ChatRoomVO chatRoom);
	
}
