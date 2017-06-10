package kosta.koggiri.attendance.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kosta.koggiri.attendance.service.AttendanceService;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

	@Inject
	private AttendanceService service;

	@RequestMapping(value = "/att_dlist", method = RequestMethod.GET)
	public void att_dlistGET(Model model, HttpSession session) throws Exception {
		String mem_id = (String) session.getAttribute("mem_id");
		model.addAttribute("einfo", service.einfo_select(mem_id));
		model.addAttribute("list", service.att_dlit(mem_id));
	}	

}
