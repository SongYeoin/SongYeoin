package com.syi.project.model.chat;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ChatRoomVO {
	//채팅방 넘버
	private int chatRoomNo;
	
	//채팅방 생성날짜
	private LocalDateTime chatRoomCreateDate;
	
	//클래스 넘버
	private int classNo;
	
	//채팅방에 속해 있는 멤버 넘버
	private int chatRoomMemberNo;
	
	//채팅방에 속해 있는 담당자 넘버
	private int chatRoomAdminNo;
	
}
