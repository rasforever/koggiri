package kosta.koggiri.approval.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import kosta.koggiri.approval.domain.ApprovalSearchVO;
import kosta.koggiri.approval.domain.ApprovalVO;
import kosta.koggiri.approval.domain.PageMaker;
import kosta.koggiri.approval.service.ApprovalService;

@Controller
@RequestMapping("/approval/*")
public class ApprovalController {
	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);

	@Inject
	private ApprovalService service;
	
	@Inject
	private AdminService service2;

	// �엯�젰 GET諛⑹떇
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(ApprovalVO approval, Model model, HttpSession session) throws Exception {
		logger.info("register get......");
		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");
		model.addAttribute("mem_aut_cd",mem_aut_cd);
		model.addAttribute("mem_id",mem_id);
		model.addAttribute("emp_nm",emp_nm);
		model.addAttribute("einfo", service.einfo_select(mem_id));
		model.addAttribute("applist", service.appty_select());
		

		model.addAttribute("msg_count", service2.msg_new_count(mem_id));  
	}

	// �엯�젰 POST諛⑹떇
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(ApprovalVO approval, RedirectAttributes rttr) throws Exception {
		logger.info("register post......");
		logger.info(approval.toString());

		service.regist(approval);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/approval/lists";
	}

	// LIST 蹂대궦 寃곗옱 議고쉶
	@RequestMapping(value = "/lists", method = RequestMethod.GET)
	public void listsPage(@ModelAttribute("search") ApprovalSearchVO search, Model model, HttpSession session)
			throws Exception {
		logger.info(search.toString());

		model.addAttribute("applist", service.appty_select());
		model.addAttribute("deptlist", service.dept_select());
		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");

		model.addAttribute("msg_count", service2.msg_new_count(mem_id));  
		model.addAttribute("mem_aut_cd",mem_aut_cd);
		model.addAttribute("mem_id",mem_id);
		model.addAttribute("emp_nm",emp_nm);
		search.setDraft_emp_id(mem_id);
		search.setSearchType("s");

		if (search.getApp_pro_cd() == null) {
			search.setApp_pro_cd(" ");
		}
		if (search.getApp_type() == null) {
			search.setApp_type(" ");
		}
		if (search.getSearch_app_id() == null) {
			search.setSearch_app_id(" ");
		}
		if (search.getApp_emp_id() == null) {
			search.setApp_emp_id(" ");
		}
		if (search.getDraft_s_dt() == null) {
			search.setDraft_s_dt("0001/01/01");
		}
		if (search.getDraft_e_dt() == null) {
			search.setDraft_e_dt("9999/12/31");
		}

		model.addAttribute("list", service.listSearchCriteria(search));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setSearch(search);

		pageMaker.setTotalCount(service.listSearchCount(search));
		model.addAttribute("pageMaker", pageMaker);

	}

	// LIST 諛쏆� 寃곗옱 議고쉶
	@RequestMapping(value = "/listr", method = RequestMethod.GET)
	public void listrPage(@ModelAttribute("search") ApprovalSearchVO search, Model model, HttpSession session)
			throws Exception {
		logger.info(search.toString());

		model.addAttribute("applist", service.appty_select());
		model.addAttribute("deptlist", service.dept_select());
		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");

		model.addAttribute("msg_count", service2.msg_new_count(mem_id));  
		model.addAttribute("mem_aut_cd",mem_aut_cd);
		model.addAttribute("mem_id",mem_id);
		model.addAttribute("emp_nm",emp_nm);
		search.setApp_emp_id(mem_id);
		search.setSearchType("r");

		if (search.getApp_pro_cd() == null) {
			search.setApp_pro_cd(" ");
		}
		if (search.getApp_type() == null) {
			search.setApp_type(" ");
		}
		if (search.getSearch_app_id() == null) {
			search.setSearch_app_id(" ");
		}
		if (search.getDraft_emp_id() == null) {
			search.setDraft_emp_id(" ");
		}
		if (search.getDept_cd() == null) {
			search.setDept_cd(" ");
		}
		if (search.getDraft_s_dt() == null) {
			search.setDraft_s_dt("0001/01/01");
		}
		if (search.getDraft_e_dt() == null) {
			search.setDraft_e_dt("9999/12/31");
		}

		model.addAttribute("list", service.listSearchCriteria(search));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setSearch(search);

		pageMaker.setTotalCount(service.listSearchCount(search));
		model.addAttribute("pageMaker", pageMaker);

	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("app_id") String app_id, @ModelAttribute("search") ApprovalSearchVO search,
			Model model, HttpSession session) throws Exception {

		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");

		model.addAttribute("msg_count", service2.msg_new_count(mem_id));  
		model.addAttribute("mem_aut_cd",mem_aut_cd);
		model.addAttribute("emp_nm",emp_nm);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute(service.read(app_id));
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("app_id") String app_id, ApprovalSearchVO search, RedirectAttributes rttr)
			throws Exception {

		service.remove(app_id);
		rttr.addAttribute("page", search.getPage());
		rttr.addAttribute("perPageNum", search.getPerPageNum());
		rttr.addAttribute("searchType", search.getSearchType());
		rttr.addAttribute("app_pro_cd", search.getApp_pro_cd());
		rttr.addAttribute("search_app_id", search.getSearch_app_id());
		rttr.addAttribute("app_type", search.getApp_type());
		rttr.addAttribute("dept_cd", search.getDept_cd());
		rttr.addAttribute("draft_emp_id", search.getDraft_emp_id());
		rttr.addAttribute("app_emp_id", search.getApp_emp_id());
		rttr.addAttribute("draft_s_dt", search.getDraft_s_dt());
		rttr.addAttribute("draft_e_dt", search.getDraft_e_dt());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/approval/lists";
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("app_id") String app_id,
			@ModelAttribute("search") ApprovalSearchVO search, Model model, HttpSession session) throws Exception {

		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");

		model.addAttribute("msg_count", service2.msg_new_count(mem_id));  
		model.addAttribute("mem_aut_cd",mem_aut_cd);
		model.addAttribute("mem_id",mem_id);
		model.addAttribute("emp_nm",emp_nm);
		model.addAttribute("einfo", service.einfo_select(mem_id));
		model.addAttribute(service.read(app_id));

	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(ApprovalVO approval, ApprovalSearchVO search, RedirectAttributes rttr)
			throws Exception {

		service.modify(approval);
		rttr.addAttribute("page", search.getPage());
		rttr.addAttribute("perPageNum", search.getPerPageNum());
		rttr.addAttribute("searchType", search.getSearchType());
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/approval/lists";
	}

	@RequestMapping(value = "/updatePage", method = RequestMethod.POST)
	public String update(ApprovalVO approval, ApprovalSearchVO search, RedirectAttributes rttr) throws Exception {

		service.update(approval);
		rttr.addAttribute("page", search.getPage());
		rttr.addAttribute("perPageNum", search.getPerPageNum());
		rttr.addAttribute("searchType", search.getSearchType());
		rttr.addAttribute("app_pro_cd", search.getApp_pro_cd());
		rttr.addAttribute("search_app_id", search.getSearch_app_id());
		rttr.addAttribute("app_type", search.getApp_type());
		rttr.addAttribute("dept_cd", search.getDept_cd());
		rttr.addAttribute("draft_emp_id", search.getDraft_emp_id());
		rttr.addAttribute("app_emp_id", search.getApp_emp_id());
		rttr.addAttribute("draft_s_dt", search.getDraft_s_dt());
		rttr.addAttribute("draft_e_dt", search.getDraft_e_dt());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/approval/listr";
	}

	@RequestMapping("getAttach/{app_id}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("app_id") String app_id) throws Exception {
		return service.getAttach(app_id);
	}

}
