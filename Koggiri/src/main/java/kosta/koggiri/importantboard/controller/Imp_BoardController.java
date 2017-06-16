package kosta.koggiri.importantboard.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.koggiri.importantboard.domain.Imp_BoardVO;
import kosta.koggiri.importantboard.domain.Imp_PageMaker;
import kosta.koggiri.importantboard.domain.Imp_SearchCriteria;
import kosta.koggiri.importantboard.service.Imp_BoardService;
import kosta.koggiri.importantboard.util.MediaUtils;


@Controller
@RequestMapping("/importantboard/*")
public class Imp_BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(Imp_BoardController.class);
	
	@Inject
	private Imp_BoardService service;
	
	@Resource(name = "uploadPath") // �떎�슫濡쒕뱶 寃쎈줈
	private String uploadPath;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(Imp_BoardVO board, Model model, HttpSession session) throws Exception{
		logger.info("register get ..........");
		String emp_nm = (String) session.getAttribute("emp_nm");
		model.addAttribute("emp_nm", emp_nm);
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(Imp_BoardVO board, RedirectAttributes rttr) throws Exception{
		logger.info("regist post ..........");
		logger.info(board.toString());
		service.regist(board);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/importantboard/listPage";
	}
	
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("i_ID")int i_ID, @ModelAttribute("cri")Imp_SearchCriteria cri, Model model) throws Exception{
		logger.info("read.....");
		model.addAttribute("Imp_BoardVO", service.read(i_ID));
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST )
	public String remove(@RequestParam("i_ID") int i_ID, Imp_SearchCriteria cri,RedirectAttributes rttr) throws Exception{
		
		service.remove(i_ID);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/importantboard/listPage";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("i_ID")int i_ID, @ModelAttribute("cri")Imp_SearchCriteria cri, Model model) throws Exception{
		
		model.addAttribute("Imp_BoardVO",service.read(i_ID));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(Imp_BoardVO board, Imp_SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/importantboard/listPage";
	}
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")Imp_SearchCriteria cri, Model model,HttpSession session) throws Exception{

		String emp_nm = (String) session.getAttribute("emp_nm");
		model.addAttribute("emp_nm", emp_nm);
		model.addAttribute("list", service.listSearchCriteria(cri));
		
		Imp_PageMaker PageMaker = new Imp_PageMaker();
		PageMaker.setCri(cri);
		//PageMaker.setTotalCount(service.listCountCriteria(cri));
		PageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", PageMaker);
	}
	
	@RequestMapping("/getAttach/{i_ID}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("i_ID")Integer i_ID)throws Exception{
		return service.getAttach(i_ID);
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteAllFiles", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {// �뿬�윭媛쒖쓽 �뙆�씪 �씠由꾩쓣 諛쏆쓣 �닔 �엳�룄濡� String[]濡� �옉�꽦.


		if (files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}

		for (String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			if (mType != null) {

				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
			}

			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}
