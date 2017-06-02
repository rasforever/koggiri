package kosta.koggiri.calendar.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.calendar.domain.EventVO;

@Repository
public class CalendarDAOImpl implements CalendarDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "koggiri.calendar.mapper.CalendarMapper";
	
	@Override
	public void calendarinsert(EventVO event) throws Exception {
		System.out.println("calendarinsert");
		session.insert(namespace+".calendarinsert", event);

	}

	@Override
	public List<EventVO> calendarList(String mem_id) throws Exception {
		
		return session.selectList(namespace+".calendarList", mem_id);
	}

	@Override
	public void updateEvent(EventVO event) throws Exception {
		session.update(namespace+".updateEvent", event);
		
	}

	@Override
	public void deleteEvent(EventVO event) throws Exception {
		session.delete(namespace+".deleteEvent", event);
		
	}
	
	
}
