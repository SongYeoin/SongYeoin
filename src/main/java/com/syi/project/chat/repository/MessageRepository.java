package com.syi.project.chat.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.syi.project.chat.model.MessageVO;

@Repository
public interface MessageRepository extends MongoRepository<MessageVO, String>{

}
