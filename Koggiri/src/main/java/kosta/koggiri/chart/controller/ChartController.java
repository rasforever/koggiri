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
	public void list(Model model, HttpSession session )throws Exception{
		String dept_id = "MT";
		System.out.println(dept_id);
		model.addAttribute("list",service.list(dept_id));
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("emp_id")String emp_id, Model model)throws Exception{
		model.addAttribute(service.read(emp_id));
	}
}
