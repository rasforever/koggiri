package kosta.koggiri.document.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.service.Doc_BoardService;

@Controller
@RequestMapping("/document/*")
public class Doc_BoardController {
	
	@Inject
	private Doc_BoardService service;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registGET(Doc_BoardVO board, Model model )throws Exception{
		
		System.out.println("컨트롤러 성공적으로 들어옴");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(Doc_BoardVO board, Model model)throws Exception{
		
		service.regist(board);
		model.addAttribute("result", "success");
		
		return "/document/success";
	}
	

	
}
