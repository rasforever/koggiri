package kosta.koggiri.chart.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.koggiri.admin_emp.service.AdminService;
import kosta.koggiri.chart.service.ChartService;

@Controller
@RequestMapping("/chart/*")
public class ChartController {
	
	@Inject
	private ChartService service;
	
	@Inject
	private AdminService service2;
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model, HttpSession session)throws Exception{
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_id = (String) session.getAttribute("mem_id");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd"); 
		
		model.addAttribute("emp_nm", emp_nm);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		model.addAttribute("msg_count", service2.msg_new_count(mem_id));
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(@RequestParam("dept_id")String dept_id, Model model, HttpSession session )throws Exception{
		System.out.println("�ϳ��� ��������.."+service.list(dept_id).get(0).getDept_nm());
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_id = (String) session.getAttribute("mem_id");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd"); 
		
		model.addAttribute("emp_nm", emp_nm);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		model.addAttribute("msg_count", service2.msg_new_count(mem_id));
		model.addAttribute("list",service.list(dept_id));
		model.addAttribute("dept",service.list(dept_id).get(0).getDept_nm());
		
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("emp_id")String emp_id, Model model, HttpSession session)throws Exception{
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_id = (String) session.getAttribute("mem_id");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd"); 
		
		model.addAttribute("emp_nm", emp_nm);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		model.addAttribute("msg_count", service2.msg_new_count(mem_id));
		model.addAttribute(service.read(emp_id));
	}
}
