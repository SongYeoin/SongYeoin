package com.syi.project.chat.service;

import java.util.List;

import com.syi.project.chat.model.MessageVO;

public interface ChatService {

	public List<MessageVO> getList(MessageVO message);
	
}
