package kosta.koggiri.attendance.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.attendance.service.AttendanceService;

@Controller
@RequestMapping("/attendance/*")
public class AttendanceController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);

	@Inject
	private AttendanceService service;

	@RequestMapping(value = "/att_dlist", method = RequestMethod.GET)
	public void att_dlistGET(@ModelAttribute("search") AttendanceVO search,Model model, HttpSession session) throws Exception {
		
		String emp_id = (String) session.getAttribute("mem_id");
		System.out.println(emp_id);
		model.addAttribute("einfo", service.einfo_select(emp_id));
		model.addAttribute("list", service.att_dlist(search));
	}	
	@RequestMapping(value = "/att_mlist", method = RequestMethod.GET)
	public void att_mlistGET(@ModelAttribute("search") AttendanceVO search,Model model, HttpSession session) throws Exception {
		
		String emp_id = (String) session.getAttribute("mem_id");
		System.out.println(emp_id);
		model.addAttribute("einfo", service.einfo_select(emp_id));
		model.addAttribute("list", service.att_mlist(search));
	}

}
