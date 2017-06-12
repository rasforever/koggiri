package kosta.koggiri.sns.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kosta.koggiri.sns.service.SnsService;


@Controller
@RequestMapping("/sns/*")
public class SnsController {
	
private static final Logger logger = LoggerFactory.getLogger(SnsController.class);
	
	@Inject
	private SnsService service;
	
	@RequestMapping(value="/listAll", method= RequestMethod.GET)
	public void listAll(Model model,  HttpSession session) throws Exception{

		
		String emp_id = (String) session.getAttribute("mem_id");
		model.addAttribute("emp_id", emp_id);
		logger.info("show all list................");
		model.addAttribute("list",service.listAll(emp_id));
		
	}
	
	@RequestMapping(value="/chat_room", method= RequestMethod.GET)
	public void chat_room(Model model, HttpSession session)throws Exception{
		
		String emp_id = (String) session.getAttribute("mem_id");
		model.addAttribute("emp_id", emp_id);
		
		
		
		model.addAttribute("chat_room",service.chat_room(emp_id));
	}
	
	

}
