package com.syi.project.chat.service;

import java.util.List;

import com.syi.project.chat.model.ChatRoomVO;

public interface ChatService {

	public List<ChatRoomVO> getChatRoomList(ChatRoomVO chatRoom);
	
	public void insertChatRoom(ChatRoomVO chatRoom);
	
}
