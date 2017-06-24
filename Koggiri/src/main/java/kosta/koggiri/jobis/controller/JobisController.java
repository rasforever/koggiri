package kosta.koggiri.jobis.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.koggiri.jobis.service.JobisService;

@Controller
@RequestMapping("/jobis/*")
public class JobisController {
	
	@Inject 
	private JobisService service;
	
	//잡이스 페이지 보여주기
	@RequestMapping(value="/jobis_page", method=RequestMethod.GET)
	public void jobis_pageGET(/*@RequestParam("input_text")String input_text ,
			@RequestParam("a") String a ,*/Model model, HttpSession session )throws Exception{
	//	System.out.println("a"+input_text);
		//System.out.println("b"+a);
		String emp_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		model.addAttribute("emp_id", emp_id);
		model.addAttribute("emp_nm", emp_nm);
		//model.addAttribute("input_text", input_text);
	//	model.addAttribute("a", a);

	//	System.out.println("c"+a);
		
	}
	
	@RequestMapping(value="/jobis_page", produces = "application/text; charset=utf8",method=RequestMethod.POST)
	@ResponseBody
	public String jobis_pagePOST(@RequestParam("a")String input_text ,Model model, RedirectAttributes rttr , HttpSession session)throws Exception{
		
		String emp_nm = (String) session.getAttribute("emp_nm");
		model.addAttribute("emp_nm", emp_nm);
		
		rttr.addFlashAttribute("input_text", input_text);
		
		//System.out.println("자비스컨트롤러에서 input_text : " + input_text);
		
		String my_text = service.jobis_content(input_text, emp_nm);
		
		//System.out.println("자비스컨트롤러에서 my_text : " + my_text);
		rttr.addFlashAttribute("my_text", my_text);
		
		
		return my_text;
	}
	
	

}
