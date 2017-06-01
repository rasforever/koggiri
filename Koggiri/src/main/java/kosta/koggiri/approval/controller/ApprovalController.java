package kosta.koggiri.approval.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.koggiri.approval.domain.ApprovalVO;
import kosta.koggiri.approval.service.ApprovalService;

@Controller
@RequestMapping("/approval/*")
public class ApprovalController {
	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);
	
	@Inject
	private ApprovalService service;
	
	@RequestMapping(value="/register", method= RequestMethod.GET)
	public void registerGET(ApprovalVO board, Model model) throws Exception{
		logger.info("register get......");
	}
	@RequestMapping(value="/register", method= RequestMethod.POST)
	public String registerPOST(ApprovalVO board, RedirectAttributes rttr) throws Exception{
		logger.info("register post......");
		logger.info(board.toString());
		
		service.regist(board);
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		//return "/board/success";
		return "redirect:/approval/listAll";
	}
	
	@RequestMapping(value="/listAll", method= RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("show all list.....................");
		model.addAttribute("list",service.listAll());	
	}
	
	@RequestMapping(value="/read", method= RequestMethod.GET)
	public void read(@RequestParam("app_id") int app_id, Model model) throws Exception{
		
		model.addAttribute(service.read(app_id));	
	}
	
	@RequestMapping(value="/remove", method= RequestMethod.POST)
	public String remove(@RequestParam("app_id") int app_id, RedirectAttributes rttr) throws Exception{
		
		service.remove(app_id);
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/approval/listAll";
	}
	
	@RequestMapping(value="/modify", method= RequestMethod.GET)
	public void modifyGET(int app_id, Model model) throws Exception{
		
		model.addAttribute(service.read(app_id));
	}
	
	@RequestMapping(value="/modify", method= RequestMethod.POST)
	public String modifyPOST(ApprovalVO board, RedirectAttributes rttr) throws Exception{
		
		logger.info("mod post.......");
		
		service.modify(board);
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:/approval/listAll";
	}

}
