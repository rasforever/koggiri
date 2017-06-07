package kosta.koggiri.chart.controller;

import javax.inject.Inject;

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
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(@RequestParam("dept_id")String dept_id, Model model)throws Exception{
		model.addAttribute("list",service.list(dept_id));
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("emp_id")String emp_id, Model model)throws Exception{
		model.addAttribute(service.read(emp_id));
	}
}
