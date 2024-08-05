package com.syi.project.service.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import com.syi.project.model.chat.ChatRoomVO;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
    private MongoTemplate mongoTemplate;

//	채팅방 정보 넣기
	@Override
    public void insertChatRoom(ChatRoomVO chatRoom) {
        mongoTemplate.insert(chatRoom);
    }

//  채팅방 목록 조회
	@Override
	public List<ChatRoomVO> getChatRoomList(ChatRoomVO chatRoom) {
		return mongoTemplate.findAll(ChatRoomVO.class, "chatrooms");
	}
	
	

}
