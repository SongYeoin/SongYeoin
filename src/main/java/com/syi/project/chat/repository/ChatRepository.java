package com.syi.project.chat.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.syi.project.chat.model.MessageVO;

public interface ChatRepository extends MongoRepository<MessageVO, String>{

}
