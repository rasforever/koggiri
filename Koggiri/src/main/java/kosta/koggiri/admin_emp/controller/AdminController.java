package kosta.koggiri.admin_emp.controller;


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
import kosta.koggiri.admin_emp.domain.App_SearchVO;
import kosta.koggiri.admin_emp.domain.EmpInfo_AdminVO;
import kosta.koggiri.admin_emp.domain.EmpVO;
import kosta.koggiri.admin_emp.domain.SearchVO;
import kosta.koggiri.admin_emp.service.AdminService;

@Controller
@RequestMapping("/admin_emp/*")
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
	
	@RequestMapping(value= "/perApp", method = RequestMethod.GET)
	public String perAppPage(App_SearchVO search, Model model, HttpSession session)throws Exception{
		model.addAttribute("list", service.select_per(search));
		
		return "/admin_emp/perApp";
	}
	
	@RequestMapping(value= "/perApp", method = RequestMethod.POST)
	public String perAppSearch(App_SearchVO search, Model model, HttpSession session)throws Exception{
		model.addAttribute("list", service.select_per(search));
		
		return "/admin_emp/perApp";
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
		String max_emp_id = service.findEmpid(vo);// 
		if (max_emp_id == null) { // 
			String no = join_dt.replace("/", ""); // 
			max_emp_id = "k" + no + "00";
		}
		num = Integer.parseInt(max_emp_id.substring(1)) + 1; // 
		// 17/04/04 ->
		// String no = join_dt.replace("/", "");
		String emp_id = "k" + String.valueOf(num); //
		vo.setEmp_id(emp_id);
		vo.setWstate_cd("0");
		vo.setInput_emp_id("master");
		service.insertEmp(vo);

		String mem_pw = vo.getRes_no().substring(0, 6); // 
		vo.setMem_pw(mem_pw);
		service.tempPass(vo);

		return "redirect:/admin_emp/manager";

	}
	
	@RequestMapping(value = "/ch_Personnel", method = RequestMethod.GET)
	public String ch_PersonnelGET(Model model) throws Exception {
		model.addAttribute("deptlist",service.dept_info());
		model.addAttribute("poslist",service.pos_info());
		return "/admin_emp/ch_Personnel";
	}

	@RequestMapping(value = "/ch_Personnel", method = RequestMethod.POST)
	public String ch_PersonnelPOST(EmpInfo_AdminVO vo, Model model) throws Exception {
		service.update_Personnel(vo);
		return "redirect:/admin_emp/manager";
	}
	
	@RequestMapping(value = "/modifyInformation", method = RequestMethod.GET)
	public String modifyInformationGET(Model model) throws Exception {
		return "/admin_emp/modifyInformation";
	}

	@RequestMapping(value = "/modifyInformation", method = RequestMethod.POST)
	public String modifyInformationPOST(EmpInfo_AdminVO vo, Model model) throws Exception {
		service.update_modifyInformation(vo);
		return "redirect:/admin_emp/manager";
	}
	
	@RequestMapping(value = "/resign", method = RequestMethod.GET)
	public String resignGET(Model model) throws Exception {
		model.addAttribute("reslist",service.res_info());
		return "/admin_emp/resign";
	}

	@RequestMapping(value = "/resign", method = RequestMethod.POST)
	public String resignPOST(EmpInfo_AdminVO vo, Model model) throws Exception {
		service.update_resign(vo);
		
		return "redirect:/admin_emp/manager";
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
	@RequestMapping(value="/emp", method = RequestMethod.GET)
	public void searchempGET(@ModelAttribute("emp") EmpVO emp, Model model) throws Exception{
		
		String emp_id = emp.getEmp_id();
		emp.setEmp_id(emp_id + "%");
		model.addAttribute("emplist",service.searchEmp(emp));
		
	}
	@RequestMapping(value="/emp", method = RequestMethod.POST)
	public void searchempPOST(@ModelAttribute("emp") EmpVO emp, Model model) throws Exception{
		
		String emp_id = emp.getEmp_id();
		emp.setEmp_id(emp_id + "%");
		System.out.println(emp.getEmp_id());
		model.addAttribute("emplist", service.searchEmp(emp));
		
	}
	@RequestMapping(value="/att_emp", method = RequestMethod.GET)
	public void searchatt_empGET(@ModelAttribute("emp") EmpVO emp, Model model) throws Exception{
		
		String emp_id = emp.getEmp_id();
		emp.setEmp_id(emp_id + "%");
		model.addAttribute("emplist",service.searchatt_Emp(emp));
		
	}
	@RequestMapping(value="/att_emp", method = RequestMethod.POST)
	public void searchatt_empPOST(@ModelAttribute("emp") EmpVO emp, Model model) throws Exception{
		
		String emp_id = emp.getEmp_id();
		emp.setEmp_id(emp_id + "%");
		System.out.println(emp.getEmp_id());
		model.addAttribute("emplist", service.searchatt_Emp(emp));
		
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
