package com.syi.project.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;

@Configuration
public class MongoDBConfig {
	private static final String CONNECTION_STRING = "mongodb://songyeoin:1234@localhost:27017/chat";

	@Bean
	public MongoClient mongoClient() {
		return MongoClients.create(CONNECTION_STRING);
	}

	@Bean
	public MongoTemplate mongoTemplate() {
		return new MongoTemplate(mongoClient(), "chat");
	}
}
