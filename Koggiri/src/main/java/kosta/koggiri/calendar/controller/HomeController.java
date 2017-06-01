/*package kosta.koggiri.calendar.controller;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kosta.koggiri.calendar.domain.EventVO;
import kosta.koggiri.calendar.service.CalendarService;

@RestController
@RequestMapping("/calendar/index")
public class HomeController {
	
	@Inject
	private CalendarService service;

	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody EventVO event){
		
		ResponseEntity<String> entity = null;
		
		try {
			service.calendarinsert(event);
			entity = new res
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}*/
