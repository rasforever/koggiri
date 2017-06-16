package kosta.koggiri.msg.controller;

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

import kosta.koggiri.msg.domain.MsgVO;
import kosta.koggiri.msg.service.MsgService;


@Controller
@RequestMapping("/sns/*")
public class MsgController {
	
private static final Logger logger = LoggerFactory.getLogger(MsgController.class);
	
	@Inject
	private MsgService service;

	//채팅 사원 목록 출력 
	@RequestMapping(value="/listAll", method= RequestMethod.GET)
	public void listAll(Model model,  HttpSession session) throws Exception{

		
		String emp_id = (String) session.getAttribute("mem_id");
		model.addAttribute("emp_id", emp_id);
		logger.info("show all list................");
		model.addAttribute("list",service.listAll(emp_id));
		
	}
	
	//채팅내역 출력
	@RequestMapping(value="/chat_room", method= RequestMethod.GET)
	public void chat_room_listGET(@ModelAttribute("vo") MsgVO vo, Model model, HttpSession session)throws Exception{
		

		System.out.println("시작");
		String emp_id = (String) session.getAttribute("mem_id");
		model.addAttribute("emp_id", emp_id);

		System.out.println("까르르르1" + vo.getN_emp_id());
		model.addAttribute("n_emp_id", vo.getN_emp_id());
			
			
		
	}
	
	//고병휘 추가
	@RequestMapping(value="/chat_room", method = RequestMethod.POST) 
	public String chat_room_listPOST(MsgVO vo, Model model, RedirectAttributes rttr)throws Exception{
		System.out.println(vo.getN_emp_id());
		service.create_chat_context(vo);
		rttr.addAttribute("msg_id", vo.getMsg_id());
		rttr.addAttribute("emp_id", vo.getEmp_id());
		rttr.addAttribute("n_emp_id", vo.getN_emp_id());
		return "redirect:/sns/chat_room";
	}
	
	@RequestMapping(value="/testchat", method = RequestMethod.GET)
	public String testchatGet(Model model, HttpSession session)throws Exception{
		
		String emp_id = (String) session.getAttribute("mem_id");
		String mem_nm = (String) session.getAttribute("mem_nm");
	
		model.addAttribute("emp_id", emp_id);
		model.addAttribute("mem_nm", mem_nm);
		
		return "redirect:http://localhost:5200";
		
	}
	
	
	
	

}
