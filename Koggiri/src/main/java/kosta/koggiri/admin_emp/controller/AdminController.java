package kosta.koggiri.admin_emp.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.koggiri.admin_emp.domain.Admin_MemberVO;
import kosta.koggiri.admin_emp.domain.EmpVO;
import kosta.koggiri.admin_emp.domain.SearchVO;
import kosta.koggiri.admin_emp.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Inject
	private AdminService service;

	@RequestMapping(value = "/manager", method = RequestMethod.GET)
	public String managerPage(SearchVO search, Model model, HttpSession session) throws Exception {

		model.addAttribute("list", service.selectList(search));

		return "/admin_emp/manager";
	}

	@RequestMapping(value = "/manager", method = RequestMethod.POST)
	public String managerSearch(SearchVO search, Model model, HttpSession session) throws Exception {
		System.out.println(search.toString());
		model.addAttribute("list", service.selectList(search));

		return "/admin_emp/manager";
	}

	@RequestMapping(value = "/joinus", method = RequestMethod.GET)
	public String joinus() throws Exception {
		return "/admin_emp/joinus";
	}

	@RequestMapping(value = "/joinus", method = RequestMethod.POST)
	@Transactional
	public String join(EmpVO vo, HttpServletResponse response) throws Exception {
		int num = 0;
		String before = vo.getJoin_dt();
		String join_dt = before.substring(2);
		vo.setJoin_dt(join_dt);
		System.out.println(vo.toString());
		String max_emp_id = service.findEmpid(vo);// k17040401
		if (max_emp_id == null) { // 그날짜에 들어온 사람이 없으면
			String no = join_dt.replace("/", ""); // 170404
			max_emp_id = "k" + no + "00";
		}
		num = Integer.parseInt(max_emp_id.substring(1)) + 1; // 17040402
		// 17/04/04 -> 170404 변환
		// String no = join_dt.replace("/", "");
		String emp_id = "k" + String.valueOf(num); // k17040402
		vo.setEmp_id(emp_id);
		vo.setWstate_cd("0");
		vo.setInput_emp_id("master");
		service.insertEmp(vo);

		String mem_pw = vo.getRes_no().substring(0, 6); // 주민번호 앞6자리를 패스워드로
		vo.setMem_pw(mem_pw);
		service.tempPass(vo);

		return "redirect:/admin/manager";

	}

	@RequestMapping(value = "/temppass", method = RequestMethod.GET)
	public String temppass() throws Exception {
		return "/admin_emp/temppass";
	}

	@RequestMapping(value = "/temppass", method = RequestMethod.POST)
	public String dotemppass(Admin_MemberVO advo, RedirectAttributes ratt) throws Exception {
		
		String mem_pw = temporaryPassword(8);
		advo.setMem_pw(mem_pw);
		service.tempPassUpdate(advo);
		ratt.addFlashAttribute("id", advo.getMem_id());
		ratt.addFlashAttribute("mem_pw", advo.getMem_pw());
		return "redirect:/admin/manager";
	}

	public static String temporaryPassword(int size) {
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();

		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9"
				.split(",");

		for (int i = 0; i < size; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
		}
		return buffer.toString();
	}

}
