package kosta.koggiri.sns.controller;

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

import kosta.koggiri.sns.domain.RoomVO;
import kosta.koggiri.sns.service.SnsService;


@Controller
@RequestMapping("/sns/*")
public class SnsController {
	
private static final Logger logger = LoggerFactory.getLogger(SnsController.class);
	
	@Inject
	private SnsService service;

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
	public void chat_room_listGET(@ModelAttribute("room") RoomVO room, Model model, HttpSession session)throws Exception{
		

		System.out.println("시작");
		String emp_id = (String) session.getAttribute("mem_id");
		model.addAttribute("emp_id", emp_id);

		System.out.println("까르르르1" + room.getN_emp_id());
		model.addAttribute("n_emp_id", room.getN_emp_id());
			
		if(service.chat_room_count(room) == 0 ){
			service.create_room(room);
			//model.addAttribute("ck_room_id", room.getRoom_id());
			model.addAttribute("roomlist",room);
			model.addAttribute("room_id", room.getRoom_id());
			System.out.println("room_id"+room.getRoom_id());
		}else{
			model.addAttribute("roomlist", service.chat(room));
			model.addAttribute("room_id", room.getRoom_id());
			
		}		
		
	}
	
	//고병휘 추가
	@RequestMapping(value="/chat_room", method = RequestMethod.POST) 
	public String chat_room_listPOST(RoomVO room, Model model, RedirectAttributes rttr)throws Exception{
		System.out.println(room.getN_emp_id());
		service.create_chat_context(room);
		rttr.addAttribute("room_id", room.getRoom_id());
		rttr.addAttribute("emp_id", room.getEmp_id());
		rttr.addAttribute("n_emp_id", room.getN_emp_id());
		return "redirect:/sns/chat_room";
	}
	
	@RequestMapping(value="/testchat", method = RequestMethod.GET)
	public String testchatGet(Model model, HttpSession session)throws Exception{
		
		String emp_id = (String) session.getAttribute("mem_id");
		model.addAttribute("emp_id", emp_id);
		
		return "redirect:http://106.242.203.68:8082";
		
	}
	
	
	
	

}
