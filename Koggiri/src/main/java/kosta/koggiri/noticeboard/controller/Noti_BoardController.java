package kosta.koggiri.noticeboard.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

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

import kosta.koggiri.noticeboard.domain.Noti_BoardVO;
import kosta.koggiri.noticeboard.domain.Noti_SearchCriteria;
import kosta.koggiri.noticeboard.domain.Noti_PageMaker;
import kosta.koggiri.noticeboard.service.Noti_BoardService;
import kosta.koggiri.noticeboard.util.MediaUtils;

@Controller
@RequestMapping("/noticeboard/*")
public class Noti_BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(Noti_BoardController.class);
	
	@Inject
	private Noti_BoardService service;
	
	@Resource(name = "uploadPath") // 다운로드 경로
	private String uploadPath;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(Noti_BoardVO board, Model model) throws Exception{
		logger.info("register get ..........");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(Noti_BoardVO board, RedirectAttributes rttr) throws Exception{
		logger.info("regist post ..........");
		logger.info(board.toString());
		service.regist(board);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/noticeboard/listPage";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("show all list...........");
		model.addAttribute("list", service.listAll());
		
		
	}
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("n_ID")int n_ID, @ModelAttribute("cri")Noti_SearchCriteria cri, Model model) throws Exception{
		logger.info("read.....");
		model.addAttribute("Noti_BoardVO", service.read(n_ID));
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST )
	public String remove(@RequestParam("n_ID") int n_ID, Noti_SearchCriteria cri,RedirectAttributes rttr) throws Exception{
		
		service.remove(n_ID);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/noticeboard/listPage";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("n_ID")int n_ID, @ModelAttribute("cri")Noti_SearchCriteria cri, Model model) throws Exception{
		
		model.addAttribute("Noti_BoardVO",service.read(n_ID));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(Noti_BoardVO board, Noti_SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/noticeboard/listPage";
	}
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")Noti_SearchCriteria cri, Model model) throws Exception{

		model.addAttribute("list", service.listSearchCriteria(cri));
		
		Noti_PageMaker PageMaker = new Noti_PageMaker();
		PageMaker.setCri(cri);
		//PageMaker.setTotalCount(service.listCountCriteria(cri));
		PageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", PageMaker);
	}
	
	@RequestMapping("/getAttach/{n_ID}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("n_ID")Integer n_ID)throws Exception{
		return service.getAttach(n_ID);
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteAllFiles", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {// 여러개의 파일 이름을 받을 수 있도록 String[]로 작성.


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
