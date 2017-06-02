package kosta.koggiri.calendar.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kosta.koggiri.calendar.domain.EventVO;
import kosta.koggiri.calendar.persistence.CalendarDAO;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Inject
	private CalendarDAO dao;
	
	@Override
	public void calendarinsert(EventVO event) throws Exception {
		dao.calendarinsert(event);

	}

	@Override
	public List<EventVO> listAll(String mem_id) throws Exception {
		
		return dao.calendarList(mem_id);
	}

	@Override
	public void calendarupdate(EventVO event) throws Exception {
		dao.updateEvent(event);
		
	}

	@Override
	public void calendardelete(EventVO event) throws Exception {
		dao.deleteEvent(event);
		
	}
	
	
	

}
