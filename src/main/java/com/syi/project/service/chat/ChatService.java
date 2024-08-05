package com.syi.project.service.chat;

import java.util.List;

import com.syi.project.model.chat.ChatRoomVO;

public interface ChatService {

	int insertChatRoom(ChatRoomVO chatRoom);

	List<ChatRoomVO> selectChatRoomList(int chatRoomMemberNo);
	
}
