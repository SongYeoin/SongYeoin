package com.syi.project.service.chat;

import java.util.List;

import com.syi.project.model.chat.MessageVO;

public interface MessageService {
	
	public MessageVO createMessage(MessageVO message);
	public List<MessageVO> getAllMessage();
	public MessageVO getMessageOne(String id);
	public void deleteMessageById(String id);
	
	

}
