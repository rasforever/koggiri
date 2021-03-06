package kosta.koggiri.home.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kosta.koggiri.admin_emp.domain.EmpTimeVO;
import kosta.koggiri.admin_emp.domain.EmpVO;
import kosta.koggiri.admin_emp.service.AdminService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Inject
	private AdminService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");

		EmpVO vo = new EmpVO();
		vo.setEmp_id(mem_id);

		EmpVO empVO = service.mainEmp(vo); // main �쉶�썝 �젙蹂�
		System.out.println(empVO.toString());
		model.addAttribute("empVO", empVO);
		model.addAttribute("serverTime", formattedDate);
		System.out.println("home:" + mem_id);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("emp_nm", emp_nm);
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		model.addAttribute("list_notice", service.list_notice());
		model.addAttribute("list_important", service.list_important());
		model.addAttribute("list_calendar", service.list_calendar(mem_id));
		model.addAttribute("msg_count", service.msg_new_count(mem_id));
		EmpTimeVO etvo = new EmpTimeVO();
		etvo = service.et_time(mem_id);

		// 휴무일 혹은 주말일때 제기랄 뿅간다 뿅뿅간다
		if (etvo == null) {
			model.addAttribute("go_w", "쉬세요");
			model.addAttribute("lev_o", "나오지마");
		} else {
			model.addAttribute("go_w", etvo.getAtt_time());
			model.addAttribute("lev_o", etvo.getLea_time());
		}


		return "/main";
	}

	// 출근
	@RequestMapping(value = "/att", method = RequestMethod.POST)
	public String att(HttpSession session) throws Exception {

		String emp_id = (String) session.getAttribute("mem_id");
		service.updateAtt(emp_id);
		return "redirect:/";
	}

	// 퇴근
	@RequestMapping(value = "/leave", method = RequestMethod.POST)
	public String leave(HttpSession session) throws Exception {

		String emp_id = (String) session.getAttribute("mem_id");
		service.updateLev(emp_id);
		return "redirect:/";
	}

}
