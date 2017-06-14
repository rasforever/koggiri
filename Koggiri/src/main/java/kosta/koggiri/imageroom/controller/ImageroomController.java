package kosta.koggiri.imageroom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import kosta.koggiri.imageroom.service.ImageroomService;

@Controller
@RequestMapping("/imageroom/*")
public class ImageroomController {
	
	@Inject
	private ImageroomService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(String emp_id, HttpSession session )throws Exception{
	}
}
