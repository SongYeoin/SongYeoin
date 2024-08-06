package mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.syi.project.mapper.club.ClubMapper;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ClubMapperTests {
	private static final Logger log = LoggerFactory.getLogger(ClubMapperTests.class);
	
	@Autowired
	private ClubMapper mapper;
	
	//조회테스트
	@Test
	public void testGetList() {
		List list = mapper.getList();
		
		for(Object a:list) {
			log.info(""+a);
		}
	}

}
