package com.syi.project.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.syi.project.model.MessageVO;

public interface ChatRepository extends MongoRepository<MessageVO, String>{

}
