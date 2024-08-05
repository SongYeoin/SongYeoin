package mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.syi.project.mapper.journal.JournalMapper;
import com.syi.project.model.journal.JournalVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class JournalMapperTests {
	
	@Autowired
	private JournalMapper journalmapper; // 매퍼 인터페이스 의존성 주입
	
	// 교육일지 등록 쿼리 테스트
	@Test
	public void journalEnroll() throws Exception {
        
		JournalVO journal = new JournalVO();
        
		

    }
	
	
	

}
