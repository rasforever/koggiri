package kosta.koggiri.task.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.koggiri.task.domain.TaskPageMaker;
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
	   public String registerGET(TaskVO task, Model model) throws Exception{
	      
	      logger.info("register get..........");
	      return "/task/register";
	   }
	   
	   @RequestMapping(value="/register", method= RequestMethod.POST)
	   public String registPOST(TaskVO task, RedirectAttributes rttr)
			   throws Exception{
	      logger.info("task_regist post...........");
	      System.out.println(task.toString());
	      task.setEmp_id("k15010201");
	      service.regist(task);
	      
	      //model.addAttribute("result","success");
	      
	      rttr.addFlashAttribute("msg","SUCCESS");
	      
	    // return "/task/success";
	      return "redirect:/task/listAll";

	   }
	   
	   @RequestMapping(value="/listAll", method= RequestMethod.GET)
	   public void listAll(Model model)throws Exception{
		   
		   logger.info("show all list....................");
		   System.out.println(service.listAll().get(0));
		   model.addAttribute("list", service.listAll());
	   }
	   
	   @RequestMapping(value="/read", method= RequestMethod.GET)
	   public void read(@RequestParam("ta_seq")int ta_seq, Model model)
	   throws Exception{
		   
		   model.addAttribute(service.read(ta_seq));
	   }
	   
	   @RequestMapping(value="/remove", method= RequestMethod.POST)
	   public String remove(@RequestParam("ta_seq") int ta_seq,
			   RedirectAttributes rttr)throws Exception{
		   
		   service.remove(ta_seq);
		   
		   rttr.addFlashAttribute("msg", "SUCCESS");
		   
		   return "redirect:/task/listAll";
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
		   
		   return "redirect:/task/listAll";
	   }
	   
	   @RequestMapping(value ="/listCri", method= RequestMethod.GET)
	   public void listAll(TaskCriteria cri, Model model)throws Exception{
		   
		   logger.info("show list Page with Criteria..........");
		   
		   model.addAttribute("list", service.listCriteria(cri));

	   }
	   
	   @RequestMapping(value="/listPage", method= RequestMethod.GET)
	   public void listPage(TaskCriteria cri, Model model)throws Exception{
		   
		   logger.info(cri.toString());
		   
		   model.addAttribute("list",service.listCriteria(cri));
		   TaskPageMaker pageMaker = new TaskPageMaker();
		   pageMaker.setCri(cri);
		   pageMaker.setTotalCount(36);
		   
		   model.addAttribute("pageMaker",pageMaker);

	   }

}
