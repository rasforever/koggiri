package kosta.koggiri.document.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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

import kosta.koggiri.admin_emp.service.AdminService;
import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.domain.Doc_Criteria;
import kosta.koggiri.document.domain.Doc_PageMaker;
import kosta.koggiri.document.domain.Doc_SearchCriteria;
import kosta.koggiri.document.service.Doc_BoardService;
import kosta.koggiri.document.util.MediaUtils;

@Controller
@RequestMapping("/document/*")
public class Doc_BoardController {

	@Inject
	private Doc_BoardService service;
	
	@Inject
	private AdminService service2;

	@Resource(name = "uploadPath") // 다운로드 경로
	private String uploadPath;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET(Doc_BoardVO board, Model model, HttpSession session) throws Exception {

		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd"); 
		
		System.out.println(mem_id);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("emp_nm", emp_nm);
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		model.addAttribute("msg_count", service2.msg_new_count(mem_id));
		

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(Doc_BoardVO board, RedirectAttributes rttr) throws Exception {

		board.getF_emp_id();
		service.regist(board);

		rttr.addFlashAttribute("msg", "success");

		// return "/document/success";
		return "redirect:/document/list";
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("f_id") int f_id, @ModelAttribute("cri") Doc_SearchCriteria cri, Model model,
			HttpSession session) throws Exception {

		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd"); 
		

		model.addAttribute("mem_id", mem_id);
		model.addAttribute("emp_nm", emp_nm);
		System.out.println("readPage에서 확인: " + mem_id);
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		model.addAttribute("msg_count", service2.msg_new_count(mem_id));

		model.addAttribute(service.read(f_id));// 조회된 게시물 jsp로 전달하기위해 모델객체 사용
		// addAttribute()작업할 때 아무런 이름 없이 데이터를 넣으면 자동으로 클래스의 이름을 소문자로 시작해서 사용.
		// BoardVO클래스의 객체이므로 boardVO이름
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("f_id") int f_id, Doc_SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		service.remove(f_id);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "success");

		return "redirect:/document/list";

	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("f_id") int f_id, @ModelAttribute("cri") Doc_SearchCriteria cri,
			Model model, HttpSession session) throws Exception {

		model.addAttribute(service.read(f_id));
		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");
		System.out.println(mem_id);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("emp_nm", emp_nm);
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		model.addAttribute("msg_count", service2.msg_new_count(mem_id));


	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(Doc_BoardVO board, Doc_SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		service.modify(board);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/document/list";
	}

	//

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Doc_SearchCriteria cri, Model model, HttpSession session) throws Exception {

		// model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));
		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");
		System.out.println(mem_id);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("emp_nm", emp_nm);
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		model.addAttribute("msg_count", service2.msg_new_count(mem_id));


		Doc_PageMaker pageMaker = new Doc_PageMaker();
		pageMaker.setCri(cri);
		// pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);

	}

	@RequestMapping(value = "/getAttach/{f_id}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("f_id") Integer f_id) throws Exception {

		return service.getAttach(f_id);
	}

	@ResponseBody
	@RequestMapping(value = "/deleteAllFiles", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {// 여러개의
																						// 파일
																						// 이름을
																						// 받을
																						// 수
																						// 있도록
																						// String[]로
																						// 작성.

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

	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {// 파라미터로 삭제할 파일의
																// 이름을 받아들임

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {

			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
			// 1.원본파일을 먼저 삭제한다.
		}

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		// 2. 썸네일파일 삭제
		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}

}
