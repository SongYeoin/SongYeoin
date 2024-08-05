package com.syi.project.model.chat;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import lombok.Data;

@Document(collection = "messages")
@Data
public class MessageVO {

	@Id
	private String id;
	
	@Field(name = "content")
	private String content;
	
	
	@Field(name="timestamp")
	private Date timeStamp;
	
	@Field(name="type")
	private String type;
	
	
}
