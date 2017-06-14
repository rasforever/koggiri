package kosta.koggiri.chart.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.koggiri.chart.service.ChartService;

@Controller
@RequestMapping("/chart/*")
public class ChartController {
	
	@Inject
	private ChartService service;
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll()throws Exception{
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(@RequestParam("dept_id")String dept_id, Model model, HttpSession session )throws Exception{
		System.out.println("하나만 가져와줘.."+service.list(dept_id).get(0).getDept_nm());
		model.addAttribute("list",service.list(dept_id));
		model.addAttribute("dept",service.list(dept_id).get(0).getDept_nm());
		
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("emp_id")String emp_id, Model model)throws Exception{
		model.addAttribute(service.read(emp_id));
	}
}
