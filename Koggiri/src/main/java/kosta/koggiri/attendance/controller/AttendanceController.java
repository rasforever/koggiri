package kosta.koggiri.attendance.controller;

import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kosta.koggiri.attendance.domain.AttendanceSearchVO;
import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.attendance.service.AttendanceService;

@Controller
@RequestMapping("/attendance/*")
public class AttendanceController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);

	@Inject
	private AttendanceService service;

	@RequestMapping(value = "/att_dlist", method = RequestMethod.GET) //본인 월 근태내역 조회
	public void att_dlistGET(@ModelAttribute("search") AttendanceVO search,Model model, HttpSession session) throws Exception {
		
		String emp_id = (String) session.getAttribute("mem_id");
		System.out.println(emp_id);
		model.addAttribute("einfo", service.einfo_select(emp_id));
		model.addAttribute("list", service.att_dlist(search));
	}	
	@RequestMapping(value = "/att_alldlist", method = RequestMethod.GET) //전사원 당일 근태내역 조회
	public void att_alldlistGET(@ModelAttribute("search") AttendanceSearchVO search,Model model, HttpSession session) throws Exception {
		
		String att_day = search.getAtt_dd();
		
		if (att_day == null){
			Calendar cal = Calendar.getInstance(); // Calendar 객체 생성.
			int year = cal.get(Calendar.YEAR);
			String month = (cal.get(Calendar.MONTH)+1) + "";			
			if (month.length() == 1){
				month = "0" + month; 
			}			
			int day = cal.get(Calendar.DATE);
			System.out.println(year+""+month+""+day);	
			String date = year+""+month+""+day;
			search.setAtt_dd(date);
		} else {
			search.setAtt_dd(att_day);
		}
		System.out.println();
		model.addAttribute("alldlist", service.att_alldlist(search));
	}
	
	@RequestMapping(value = "/att_mlist", method = RequestMethod.GET) //전사원 월 근태내역 조회
	public void att_mlistGET(@ModelAttribute("search") AttendanceSearchVO search,Model model, HttpSession session) throws Exception {
		
		String emp_id = (String) session.getAttribute("mem_id");
		System.out.println(emp_id);
		model.addAttribute("einfo", service.einfo_select(emp_id));
		model.addAttribute("list", service.att_mlist(search));
	}

}
