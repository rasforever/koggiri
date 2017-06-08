package kosta.koggiri.home.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String home(Locale locale, Model model, HttpSession session)throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		
		
		EmpVO vo = new EmpVO();
		vo.setEmp_id(mem_id);
		
		EmpVO empVO = service.mainEmp(vo); //main 회원 정보
		System.out.println(empVO.toString());
		model.addAttribute("empVO", empVO);
		model.addAttribute("serverTime", formattedDate );
		System.out.println("home:"+mem_id);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("emp_nm", emp_nm);
		//  return "login/loginForm";    로그인기능 완성 되면 활성화
		
		return "/main";
	}
	
	
}
