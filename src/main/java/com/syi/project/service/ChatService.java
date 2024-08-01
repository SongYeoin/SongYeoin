package com.syi.project.service;

import java.util.List;

import com.syi.project.model.ChatRoomVO;

public interface ChatService {

	public List<ChatRoomVO> getChatRoomList(ChatRoomVO chatRoom);
	
	public void insertChatRoom(ChatRoomVO chatRoom);
	
}
