package kosta.koggiri.calendar.persistence;

import java.util.List;

import kosta.koggiri.calendar.domain.EventVO;

public interface CalendarDAO {
	
	public void calendarinsert(EventVO event)throws Exception;
	public List<EventVO> calendarList(String mem_id)throws Exception;
	public void updateEvent(EventVO event)throws Exception;
	public void deleteEvent(EventVO event)throws Exception;
}
