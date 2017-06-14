package kosta.koggiri.imageroom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import kosta.koggiri.imageroom.service.ImageroomService;

@Controller
@RequestMapping("/imageroom/*")
public class ImageroomController {
	
	@Inject
	private ImageroomService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(Model model,HttpSession session)throws Exception{
		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("emp_nm", emp_nm);
		
	}
}
