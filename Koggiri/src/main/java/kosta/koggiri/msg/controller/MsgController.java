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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.koggiri.msg.domain.MsgVO;
import kosta.koggiri.msg.service.MsgService;


@Controller
@RequestMapping("/msg/*")
public class MsgController {
	
private static final Logger logger = LoggerFactory.getLogger(MsgController.class);
	
	@Inject
	private MsgService service;

	//채팅 사원 목록 출력 
	@RequestMapping(value="/msg_emplist", method= RequestMethod.GET)
	public void msg_emplist(Model model,  HttpSession session) throws Exception{
		
		String emp_id = (String) session.getAttribute("mem_id");
		model.addAttribute("emp_id", emp_id);
		logger.info("show all list................");
		model.addAttribute("list",service.msg_emplist(emp_id));
		
	}
	
	//채팅내역 출력
	@RequestMapping(value="/msg_content", method= RequestMethod.GET)
	public void msg_contentGET(@ModelAttribute("vo") MsgVO vo, Model model, HttpSession session)throws Exception{		

		String emp_id = (String) session.getAttribute("mem_id");
		model.addAttribute("emp_id", emp_id);
		if(service.msg_count(vo) == 0 ){
			model.addAttribute("msglist",service.create_msg(vo));
			model.addAttribute("msg_id", vo.getMsg_id());
			model.addAttribute("n_emp_id", vo.getN_emp_id());
		}else{
			model.addAttribute("msglist", service.msgcontent(vo));
			model.addAttribute("msg_id", vo.getMsg_id());		
			model.addAttribute("n_emp_id", vo.getN_emp_id());	
		}	
	}
	
	//채팅 대화내용 보내기(POST)
	@RequestMapping(value="/msg_content", method = RequestMethod.POST) 
	public String msg_contentPOST(MsgVO vo, Model model, RedirectAttributes rttr)throws Exception{
		
		service.create_msg_context(vo);
		
		rttr.addAttribute("msg_id", vo.getMsg_id());
		rttr.addAttribute("emp_id", vo.getEmp_id());
		rttr.addAttribute("n_emp_id", vo.getN_emp_id());
		
		return "redirect:/msg/msg_content";
		
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
