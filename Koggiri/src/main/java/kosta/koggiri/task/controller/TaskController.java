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
import kosta.koggiri.task.domain.TaskCriteria;
import kosta.koggiri.task.domain.TaskVO;

import kosta.koggiri.task.service.TaskService;

@Controller
@RequestMapping("/task/*")
public class TaskController {

	private static final Logger logger = LoggerFactory.getLogger(TaskController.class);
	
	@Inject
	private TaskService service;
	
	@RequestMapping(value="/register", method= RequestMethod.GET)
	   public String registerGET(TaskVO task, Model model, HttpSession session) throws Exception{
	      
		String mem_id = (String) session.getAttribute("mem_id");
		model.addAttribute("mem_id", mem_id);
	      logger.info("register get..........");
	      return "/task/register";
	   }
	   
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
	
	   
	   @RequestMapping(value="/read", method= RequestMethod.GET)
	   public void read(@RequestParam("ta_seq")int ta_seq, Model model)
	   throws Exception{
		   
		   
		   model.addAttribute(service.read(ta_seq));
	   }
	   
	   @RequestMapping(value="/readPage", method=RequestMethod.GET)
	   public void read(@RequestParam("ta_seq") int ta_seq,
			   @ModelAttribute("cri") TaskCriteria cri,
			   Model model, HttpSession session)throws Exception{
		 
			String mem_id = (String) session.getAttribute("mem_id");
			model.addAttribute("mem_id", mem_id);
		   model.addAttribute(service.read(ta_seq));
	   }
	   
	   @RequestMapping(value="/remove", method= RequestMethod.POST)
	   public String remove(@RequestParam("ta_seq") int ta_seq,
			   RedirectAttributes rttr)throws Exception{
		   
		   service.remove(ta_seq);
		   
		   
		   rttr.addFlashAttribute("msg", "SUCCESS");
		   
		   return "redirect:/task/list";
	   }
	   
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
	   
	   @RequestMapping(value="/modify", method= RequestMethod.GET)
	   public void modifyGET(int ta_seq, Model model)throws Exception{
		   
		   model.addAttribute(service.read(ta_seq));
	   }
	   
	   @RequestMapping(value="/modify", method= RequestMethod.POST)
	   public String modifyPOST(TaskVO task,
			   RedirectAttributes rttr)throws Exception{
		   
		   logger.info("mod post.........");
		   
		   service.modify(task);
		   rttr.addFlashAttribute("msg", "SUCCESS");
		   
		   return "redirect:/task/list";
	   }
	   
	   @RequestMapping(value="/modifyPage", method= RequestMethod.GET)
	   public void modifyPagingGET(@RequestParam("ta_seq") int ta_seq,
			   @ModelAttribute("cri") TaskCriteria cri,
			   Model model, HttpSession session)throws Exception{
		   
		   String mem_id = (String) session.getAttribute("mem_id");
			model.addAttribute("mem_id", mem_id);
		   model.addAttribute(service.read(ta_seq));
	   }
	   
	   @RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	   public String modifyPagingPOST(TaskVO task, TaskCriteria cri, RedirectAttributes rttr)
	   throws Exception{
		   
		   service.modify(task);
		   
		   rttr.addAttribute("page",cri.getPage());
		   rttr.addAttribute("perPageNum",cri.getPerPageNum());
		   rttr.addFlashAttribute("msg","SUCCESS");
		   
		   return "redirect:/task/list";
	   }

		@RequestMapping(value="/list", method=RequestMethod.GET)
		public void listPage(@ModelAttribute("cri") TaskSearchCriteria cri, Model model, HttpSession session)throws Exception{
			
			 String mem_id = (String) session.getAttribute("mem_id");
			model.addAttribute("mem_id", mem_id);
			//model.addAttribute("list", service.listCriteria(cri));
			model.addAttribute("list", service.listSearchCriteria(cri));
			
			TaskPageMaker pageMaker = new TaskPageMaker();
			pageMaker.setCri(cri);
			//pageMaker.setTotalCount(service.listCountCriteria(cri));
			pageMaker.setTotalCount(service.listSearchCount(cri));
			System.out.println(cri.getKeyword());
			
			model.addAttribute("pageMaker", pageMaker);
			
		}

}
