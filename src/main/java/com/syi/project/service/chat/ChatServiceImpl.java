package com.syi.project.service.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syi.project.mapper.chat.ChatRoomMapper;
import com.syi.project.model.chat.ChatRoomVO;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
    private ChatRoomMapper chatRoomMapper;

//	채팅방 정보 넣기
	@Override
    public int insertChatRoom(ChatRoomVO chatRoom) {
        return chatRoomMapper.insertChatRoom(chatRoom);
    }

//  채팅방 목록 조회
	@Override
	public List<ChatRoomVO> selectChatRoomList(int chatRoomMemberNo) {
		return chatRoomMapper.selectChatRoomList(chatRoomMemberNo);
	}

	
	

}
