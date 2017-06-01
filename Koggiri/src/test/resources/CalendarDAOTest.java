import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kosta.koggiri.calendar.domain.EventVO;
import kosta.koggiri.calendar.persistence.CalendarDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class CalendarDAOTest {
	
	@Inject
	private CalendarDAO dao;
	private static Logger logger = LoggerFactory.getLogger(CalendarDAOTest.class);
	
	@Test
	public void test()throws Exception {
		
		EventVO event = new EventVO();
		event.set_id("_fc2");
		event.setTitle("sadfad");
		event.setStart_date("2016-06-20");
		event.setEnd_date("2017-07-01");
		event.setContent("adf");
		event.setMem_id("k15010201");
		
		dao.calendarinsert(event);
	}

}
