package com.syi.project.mapper.chat;

import java.util.List;

import com.syi.project.model.chat.ChatRoomVO;

public interface ChatRoomMapper {

	int insertChatRoom(ChatRoomVO chatRoom);

	List<ChatRoomVO> selectChatRoomList(int chatRoomMemberNo);

	
	
}
