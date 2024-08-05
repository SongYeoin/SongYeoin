package com.syi.project.mapper.chat;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.syi.project.model.chat.MessageVO;

@Repository
public interface MessageRepository extends MongoRepository<MessageVO, String>{

}
