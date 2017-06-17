package kosta.koggiri.task.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.koggiri.task.domain.TaskPageMaker;
import kosta.koggiri.task.domain.TaskSearchCriteria;
import kosta.koggiri.admin_emp.service.AdminService;
import kosta.koggiri.task.domain.TaskCriteria;
import kosta.koggiri.task.domain.TaskVO;

import kosta.koggiri.task.service.TaskService;

@Controller
@RequestMapping("/task/*")
public class TaskController {

	private static final Logger logger = LoggerFactory.getLogger(TaskController.class);
	
	@Inject
	private TaskService service;
	private AdminService service2;
	
	
	//등록 (get방식) -세션불러와서 값을 가지고 있음
	@RequestMapping(value="/register", method= RequestMethod.GET)
	   public String registerGET(TaskVO task, Model model, HttpSession session) throws Exception{
	      
		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");
		model.addAttribute("mem_aut_cd",mem_aut_cd);
		model.addAttribute("msg_count", service2.msg_new_count(mem_id));      
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("emp_nm", emp_nm);
		
	      logger.info("register get..........");
	      return "/task/register";
	   }
	   
	//등록(post방식) - 세션을 그대로 보내서 값을 리스트에 뿌려준다
	   @RequestMapping(value="/register", method= RequestMethod.POST)
	   public String registPOST(TaskVO task, RedirectAttributes rttr,HttpSession session)
			   throws Exception{
	      logger.info("task_regist post...........");
	      task.setEmp_id( (String) session.getAttribute("mem_id"));
	      System.out.println(task.toString());
	      service.regist(task);
	      
	      //model.addAttribute("result","success");
	      
	      rttr.addFlashAttribute("msg","SUCCESS");
	      
	    // return "/task/success";
	      return "redirect:/task/list";

	   }

	   //상세보기 (get방식) - 세션을 가지고 있고 그냥 상세보기 해주는 방식 
	   @RequestMapping(value="/readPage", method=RequestMethod.GET)
	   public void read(@RequestParam("ta_seq") int ta_seq,
			   @ModelAttribute("cri") TaskCriteria cri,
			   Model model, HttpSession session)throws Exception{
		 
			String mem_id = (String) session.getAttribute("mem_id");
			String emp_nm = (String) session.getAttribute("emp_nm");
			String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");
			model.addAttribute("mem_aut_cd",mem_aut_cd);
			model.addAttribute("mem_id", mem_id);
			model.addAttribute("emp_nm", emp_nm);
			model.addAttribute("msg_count", service2.msg_new_count(mem_id));      
		   model.addAttribute(service.read(ta_seq));
	   }
	   
	   //상세보기에서 삭제하는 페이지 (post방식) 
	   @RequestMapping(value="/removePage", method=RequestMethod.POST)
	   public String remove(@RequestParam("ta_seq") int ta_seq,
			   TaskCriteria cri, 
			   RedirectAttributes rttr)throws Exception{
		
		   service.remove(ta_seq);
		   
		   rttr.addAttribute("page",cri.getPage());
		   rttr.addAttribute("perPageNum", cri.getPerPageNum());
		   rttr.addFlashAttribute("msg", "SUCCESS");
		   
		   return "redirect:/task/list";
	   }
	   
	   //상세보기에서 수정하는 페이지(get방식)
	   @RequestMapping(value="/modifyPage", method= RequestMethod.GET)
	   public void modifyPagingGET(@RequestParam("ta_seq") int ta_seq,
			   @ModelAttribute("cri") TaskCriteria cri,
			   Model model, HttpSession session)throws Exception{
		   
		   String mem_id = (String) session.getAttribute("mem_id");
		   String emp_nm = (String) session.getAttribute("emp_nm");
		   String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");
			model.addAttribute("mem_aut_cd",mem_aut_cd);
			model.addAttribute("mem_id", mem_id);
			model.addAttribute("emp_nm", emp_nm);
			model.addAttribute("msg_count", service2.msg_new_count(mem_id));      
		   model.addAttribute(service.read(ta_seq));
	   }
	   
	   //상세보기에서 수정하는 페이지(post방식) 
	   @RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	   public String modifyPagingPOST(TaskVO task, TaskCriteria cri, RedirectAttributes rttr)
	   throws Exception{
		   
		   service.modify(task);
		   
		   rttr.addAttribute("page",cri.getPage());
		   rttr.addAttribute("perPageNum",cri.getPerPageNum());
		   rttr.addFlashAttribute("msg","SUCCESS");
		   
		   return "redirect:/task/list";
	   }

	   //리스트 서치까지 작업하는 페이지 
		@RequestMapping(value="/list", method=RequestMethod.GET)
		public void listPage(@ModelAttribute("cri") TaskSearchCriteria cri, Model model, HttpSession session)throws Exception{
			
			String mem_id = (String) session.getAttribute("mem_id");
			String emp_nm = (String) session.getAttribute("emp_nm");
			String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");
			model.addAttribute("mem_aut_cd",mem_aut_cd);
			model.addAttribute("mem_id", mem_id);
			model.addAttribute("emp_nm", emp_nm);
	
			cri.setEmp_id(mem_id);
			System.out.println(cri.getEmp_id());
			//model.addAttribute("list", service.listCriteria(cri));
			model.addAttribute("msg_count", service2.msg_new_count(mem_id));      
			model.addAttribute("list", service.listSearchCriteria(cri));
			
			TaskPageMaker pageMaker = new TaskPageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(service.listCountCriteria(cri));
			pageMaker.setTotalCount(service.listSearchCount(cri));
			System.out.println(cri.getKeyword());
			model.addAttribute("pageMaker", pageMaker);
			
		}

}
