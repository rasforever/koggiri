package kosta.koggiri.document.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.domain.Doc_Criteria;
import kosta.koggiri.document.domain.Doc_PageMaker;
import kosta.koggiri.document.domain.Doc_SearchCriteria;
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
	public String registerPOST(Doc_BoardVO board, RedirectAttributes rttr)throws Exception{
		
		service.regist(board);
		
		rttr.addFlashAttribute("msg", "success");
		
		//return "/document/success";
		return "redirect:/document/list";
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model)throws Exception{
		System.out.println("페이지넘겨버리기~~~");
		
		model.addAttribute("list", service.listAll());
	}
	
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void read(@RequestParam("f_id")int f_id,@ModelAttribute("cri") Doc_Criteria cri, Model model)throws Exception{
		System.out.println("리드페이지로 넘어와버리기~");
		
		model.addAttribute(service.read(f_id));//조회된 게시물 jsp로 전달하기위해 모델객체 사용
		//addAttribute()작업할 때 아무런 이름 없이 데이터를 넣으면 자동으로 클래스의 이름을 소문자로 시작해서 사용.
		//BoardVO클래스의 객체이므로 boardVO이름
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("f_id")int f_id, RedirectAttributes rttr)throws Exception{
		
		service.remove(f_id);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/document/listAll";
		
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(int f_id, Model model)throws Exception{
		
		model.addAttribute(service.read(f_id));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(Doc_BoardVO board, RedirectAttributes rttr)throws Exception{
		
		service.modify(board);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/document/listAll";
	}
	
	@RequestMapping(value="/listCri", method=RequestMethod.GET)
	public void listAll(Doc_Criteria cri, Model model)throws Exception{
		
		model.addAttribute("list", service.listCriteria(cri));
	}
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void listPage(Doc_Criteria cri, Model model)throws Exception{
		
		model.addAttribute("list", service.listCriteria(cri));
		
		Doc_PageMaker pageMaker = new Doc_PageMaker();
		
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(76);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/removePage", method=RequestMethod.POST)
	public String remove(@RequestParam("f_id")int f_id, Doc_Criteria cri, RedirectAttributes rttr)throws Exception{
		
		service.remove(f_id);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/document/listPage";
		
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("f_id")int f_id, @ModelAttribute("cri") Doc_Criteria cri, Model model)throws Exception{
		
		model.addAttribute(service.read(f_id));
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String modifyPagingPOST(Doc_BoardVO board, Doc_Criteria cri, RedirectAttributes rttr)throws Exception{
		
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/document/listPage";
	}
	
	//
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Doc_SearchCriteria cri, Model model)throws Exception{
		
		model.addAttribute("list", service.listCriteria(cri));
		
		Doc_PageMaker pageMaker = new Doc_PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
	}

	
}
