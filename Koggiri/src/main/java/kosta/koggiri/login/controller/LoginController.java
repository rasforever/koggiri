package kosta.koggiri.login.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kosta.koggiri.admin_emp.service.AdminService;
import kosta.koggiri.login.domain.MemberVO;
import kosta.koggiri.login.dto.LoginDTO;
import kosta.koggiri.login.service.LoginService;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

	@Inject
	private LoginService service;
	
	@Inject
	private AdminService service2;
	
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = { "", "/logout" }, method = RequestMethod.GET) // 다중매핑
	public String loginpage(@ModelAttribute("dto") LoginDTO dto, HttpServletRequest request) throws Exception {
		System.out.println("loginpage");
		HttpSession session = request.getSession(false);
		if (session != null) { // logout시 세션 삭제

			session.invalidate();

		}

		return "/login/loginForm";
	}

	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public void logincheck(LoginDTO dto, HttpSession session, Model model) throws Exception {

		MemberVO vo = service.logincheck(dto);

		if (vo == null) {

			return;
		}

		String empnm = service.getEmpnmbyMemid(vo);

		model.addAttribute("memberVO", vo);
		model.addAttribute("empnm", empnm);

	}

	@RequestMapping(value = "/passcheck", method = RequestMethod.GET)
	public void passcheck(HttpSession session, Model model) throws Exception {
		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");
		model.addAttribute("mem_aut_cd",mem_aut_cd);
		model.addAttribute("emp_nm",emp_nm);
		model.addAttribute("mem_id", mem_id);

		model.addAttribute("msg_count", service2.msg_new_count(mem_id));  
	}

	@RequestMapping(value = "/passcheck", method = RequestMethod.POST)
	public String passcheck(MemberVO vo, LoginDTO dto, HttpSession session, HttpServletResponse response, Model model)
			throws Exception {

		vo.setMem_id((String) session.getAttribute("mem_id"));
		dto.setMem_id((String) session.getAttribute("mem_id"));
		
		MemberVO membervo = service.logincheck(dto);
		if (membervo == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.');");
			out.println("location.href='/login/passcheck';");
			out.println("</script>");
			out.close();
		} 
		
		/*String mem_id = (String) session.getAttribute("mem_id");
		MemberVO mem= service.detail_mem(mem_id);
		mem.g
		
		model.addAttribute("mem", mem);*/

		return "redirect:/login/modify";
	}
	
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(HttpSession session, Model model) throws Exception {
		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");
		model.addAttribute("mem_aut_cd",mem_aut_cd);
		model.addAttribute("emp_nm",emp_nm);
		model.addAttribute("mem_id", mem_id);

		model.addAttribute("msg_count", service2.msg_new_count(mem_id));  

	}
	

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@Transactional
	public void modify(MemberVO vo, HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String mem_id = (String) session.getAttribute("mem_id");
		vo.setE_mail(vo.getE_mail1() + vo.getE_mail2());
		vo.setAddr(vo.getAddr1() + " " + vo.getAddr2());
		vo.setTel_no(vo.getTelno1() + "-" + vo.getTelno2() + "-" + vo.getTelno3());

		vo.setMem_id(mem_id);

		MultipartFile uploadfile = vo.getFile();
        if (uploadfile != null) {
            String fileName = uploadfile.getOriginalFilename();
            fileName = mem_id + fileName.substring(fileName.lastIndexOf("."));
            vo.setFilename(fileName);
            try {
                // 1. C:\\kosta\\upload
                File file = new File("C:/kosta/upload/emp/" + fileName);
                uploadfile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            } // try - catch
        } // if
		/*if (vo.getMem_pw() == "" && vo.getAddr1() == "" && vo.getAddr2() == "" && vo.getE_mail1() == ""
				&& vo.getTelno2() == "" && vo.getTelno3() == "") {
			out.println("<script>");
			out.println("alert('항목을 모두 입력해주세요.');");
			out.println("</script>");
			out.close();
			return "/login/modify";
			
		}else{*/
			service.mem_update(vo);
			service.mem_pass(vo);
			out.println("<script>");
			out.println("alert('수정 되었습니다.');");
			out.println("location.href='/';");
			out.println("</script>");
			out.close();
			
		//}

	}

}
