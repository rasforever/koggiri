package kosta.koggiri.approval.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.koggiri.approval.domain.ApprovalSearchVO;
import kosta.koggiri.approval.domain.ApprovalVO;
import kosta.koggiri.approval.domain.PageMaker;
import kosta.koggiri.approval.domain.SearchCriteria;
import kosta.koggiri.approval.service.ApprovalService;

@Controller
@RequestMapping("/approval/*")
public class ApprovalController {
	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);

	@Inject
	private ApprovalService service;

	// 입력 GET방식
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(ApprovalVO approval, Model model) throws Exception {
		logger.info("register get......");
		model.addAttribute("einfo", service.einfo_select("k15010201"));
		model.addAttribute("applist", service.appty_select());
	}

	// 입력 POST방식
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(ApprovalVO approval, RedirectAttributes rttr) throws Exception {
		logger.info("register post......");
		logger.info(approval.toString());

		service.regist(approval);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/approval/list";
	}
	
	// LIST 보낸 결재 조회
		@RequestMapping(value = "/lists", method = RequestMethod.GET)
		public void listsPage(@ModelAttribute("search") ApprovalSearchVO search, Model model) throws Exception {
			logger.info(search.toString());

			model.addAttribute("applist", service.appty_select());
			model.addAttribute("deptlist", service.dept_select());
			model.addAttribute("list", service.listSearchCriteria(search));

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(search);

			pageMaker.setTotalCount(service.listSearchCount(search));
			model.addAttribute("pageMaker", pageMaker);

		}

	// LIST 받은 결재 조회
	@RequestMapping(value = "/listr", method = RequestMethod.GET)
	public void listrPage(@ModelAttribute("search") ApprovalSearchVO search, Model model) throws Exception {
		logger.info(search.toString());

		model.addAttribute("list", service.listSearchCriteria(search));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(search);

		pageMaker.setTotalCount(service.listSearchCount(search));
		model.addAttribute("pageMaker", pageMaker);

	}

	

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("app_id") String app_id, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		model.addAttribute(service.read(app_id));
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("app_id") String app_id, SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		service.remove(app_id);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/approval/list";
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("app_id") String app_id, @ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception {

		model.addAttribute("einfo", service.einfo_select("k15010201"));
		model.addAttribute(service.read(app_id));

	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(ApprovalVO approval, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

		service.modify(approval);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/approval/list";
	}

}
