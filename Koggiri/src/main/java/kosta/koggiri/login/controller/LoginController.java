package kosta.koggiri.login.controller;

import java.io.PrintWriter;

import javax.inject.Inject;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kosta.koggiri.login.domain.MemberVO;
import kosta.koggiri.login.dto.LoginDTO;
import kosta.koggiri.login.service.LoginService;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@Inject
	private LoginService service;
	
	@RequestMapping(value= "", method = RequestMethod.GET)
	public String loginpage(@ModelAttribute("dto") LoginDTO dto)throws Exception{
		
		return "/login/loginForm";
	}
	
	@RequestMapping(value="/check", method = RequestMethod.POST)
	public void logincheck(LoginDTO dto,HttpSession session,Model model)throws Exception{
			
		
		MemberVO vo = service.logincheck(dto);
		
		
		if(vo == null){
			
			return;
		}

			String empnm = service.getEmpnmbyMemid(vo);

			
		model.addAttribute("memberVO", vo);
		model.addAttribute("empnm", empnm);
		
	}
}
