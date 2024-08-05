package mapper.chat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.syi.project.model.chat.ChatRoomVO;
import com.syi.project.service.chat.ChatService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ChatRoomMapperTests {

	@Autowired
	private ChatService chatService;
	
	
	@Test
	public void insertChatRoom() {
		ChatRoomVO chatRoomVO = new ChatRoomVO();
		chatRoomVO.setClassNo(1);
		chatRoomVO.setChatRoomMemberNo(1);
		chatRoomVO.setChatRoomAdminNo(4);
		//날짜
	}
	
	
}
