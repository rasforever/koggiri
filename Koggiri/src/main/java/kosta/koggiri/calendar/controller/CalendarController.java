package kosta.koggiri.calendar.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import kosta.koggiri.calendar.domain.EventVO;
import kosta.koggiri.calendar.service.CalendarService;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	@Inject
	private CalendarService service;

	@RequestMapping(value = "/index")
	public String calendar(HttpServletRequest request,Model model) throws Exception {
		HttpSession session =request.getSession();
		String emp_nm = (String) session.getAttribute("emp_nm");
		model.addAttribute("emp_nm", emp_nm);
		return "/calendar/index";
	}

	@RequestMapping("/insert")
	public void register(@RequestBody EventVO event, HttpServletRequest request) throws Exception {
		
		HttpSession session =request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		event.setMem_id(mem_id);
		event.setStart_date(event.getStart());
		
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date tempDate = sdFormat.parse(event.getEnd());

		Calendar cal = Calendar.getInstance();

		cal.setTime(tempDate);

		cal.add(Calendar.DAY_OF_MONTH, -1); // 하루 전날로 바꿈
		
		String enddate = sdFormat.format(cal.getTime());
		event.setEnd_date(enddate);
		
		System.out.println(event.toString());
		service.calendarinsert(event);
	}

	@RequestMapping("/get")
	@ResponseBody
	public void listget(HttpServletResponse response,HttpServletRequest request) throws Exception {
		
		HttpSession session =request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		
		List<EventVO> listEvent = service.listAll(mem_id);

		for (int i = 0; i < listEvent.size(); i++) {
			listEvent.get(i).setContent(listEvent.get(i).getContent().replace("\n", "<br>"));

			String end = listEvent.get(i).getEnd_date();

			DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");

			Date tempDate = sdFormat.parse(end);

			Calendar cal = Calendar.getInstance();

			cal.setTime(tempDate);

			cal.add(Calendar.DAY_OF_MONTH, 1); // 하루 다음날로 바꿈

			String enddate = sdFormat.format(cal.getTime());

			listEvent.get(i).setEnd_date(enddate);

		}

		JSONArray jsonArray = JSONArray.fromObject(listEvent);

		String events = jsonArray.toString().replace("start_date", "start").replace("end_date", "end");

		// db에서 start end가 안되서 고침

	

		response.setContentType("application/json");

		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		out.write(events);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public void update(@RequestBody EventVO event,HttpServletRequest request)throws Exception{
		HttpSession session =request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		event.setMem_id(mem_id);
		event.setStart_date(event.getStart());
		
			String end = event.getEnd();
			
			
	      
	       
	       DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
	       
	       Date tempDate = sdFormat.parse(end);
	       
	       Calendar cal = Calendar.getInstance();
	       
	       cal.setTime(tempDate);
	       
	       cal.add(Calendar.DAY_OF_MONTH, -1); // 하루 전날로 바꿈
	       
	       String enddate = sdFormat.format(cal.getTime());
	       
	       event.setEnd_date(enddate);
	       System.out.println(event.toString());
	       service.calendarupdate(event);
	}

	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void delete(@RequestBody EventVO event,HttpServletRequest request)throws Exception{
		HttpSession session =request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		event.setMem_id(mem_id);
		service.calendardelete(event);
	}
}
