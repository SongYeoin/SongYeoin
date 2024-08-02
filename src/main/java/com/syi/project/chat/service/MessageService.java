package com.syi.project.chat.service;

import java.util.List;

import com.syi.project.chat.model.MessageVO;

public interface MessageService {
	
	public MessageVO createMessage(MessageVO message);
	public List<MessageVO> getAllMessage();
	public MessageVO getMessageOne(String id);
	public void deleteMessageById(String id);
	
	

}
