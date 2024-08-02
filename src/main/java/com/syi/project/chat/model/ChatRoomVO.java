package com.syi.project.chat.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;

@Document(collation = "chatrooms")
@Data
public class ChatRoomVO {
	
	@Id
	private String id;
	
}
