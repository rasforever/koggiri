package kosta.koggiri.calendar.service;

import java.util.List;

import kosta.koggiri.calendar.domain.EventVO;

public interface CalendarService {
	
	public void calendarinsert(EventVO event)throws Exception;
	
	public List<EventVO> listAll(String mem_id)throws Exception;
	
	public void calendarupdate(EventVO event)throws Exception;
	
	public void calendardelete(EventVO event)throws Exception;
}
