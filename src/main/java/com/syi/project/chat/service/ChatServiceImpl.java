package com.syi.project.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.syi.project.chat.model.MessageVO;

public class ChatServiceImpl implements ChatService {

	private String dbName = "chat";

	@Autowired
	private MongoTemplate mongodb;

	// 등록
	public String insertData(MessageVO message) throws Exception {
		mongodb.insert(message, dbName); // vo객체에 정보를 토대로 알아서 등록한다.
		
		return message.getMessageNo(); // id가 등록된 고유 키 값이다. 등록이 성공하면 vo에 담아준다.
	}

	@Override
	public List<MessageVO> getList(MessageVO message) {
		return mongodb.find(null, MessageVO.class, dbName);
	}

}
