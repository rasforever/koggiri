package kosta.koggiri.attendance.controller;

import java.io.PrintWriter;
import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.koggiri.admin_emp.service.AdminService;
import kosta.koggiri.attendance.domain.Att_EmpVO;
import kosta.koggiri.attendance.domain.Att_Vat_DtVO;
import kosta.koggiri.attendance.domain.AttendanceSearchVO;
import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.attendance.service.AttendanceService;

@Controller
@RequestMapping("/attendance/*")
public class AttendanceController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);

	@Inject
	private AttendanceService service;

	@Inject
	private AdminService service2;

	@RequestMapping(value = "/att_dlist", method = RequestMethod.GET) // ���� ��
																		// ���³���
																		// ��ȸ
	public void att_dlistGET(@ModelAttribute("search") AttendanceVO search, Model model, HttpSession session)
			throws Exception {

		String emp_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		String ck_emp_id = search.getEmp_id();
		model.addAttribute("mem_id", emp_id);
		model.addAttribute("emp_nm", emp_nm);

		model.addAttribute("msg_count", service2.msg_new_count(emp_id));

		if (ck_emp_id == null) {
			search.setEmp_id(emp_id);
			model.addAttribute("einfo", service.einfo_select(emp_id));
		} else {
			search.setEmp_id(ck_emp_id);
			model.addAttribute("einfo", service.einfo_select(ck_emp_id));
		}

		model.addAttribute("list", service.att_dlist(search));
	}

	@RequestMapping(value = "/att_alldlist", method = RequestMethod.GET) // �����
																			// ����
																			// ���³���
																			// ��ȸ
	public void att_alldlistGET(@ModelAttribute("search") AttendanceSearchVO search, Model model, HttpSession session)
			throws Exception {

		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("emp_nm", emp_nm);

		model.addAttribute("msg_count", service2.msg_new_count(mem_id));
		String att_day = search.getAtt_dd();

		if (att_day == null) {
			Calendar cal = Calendar.getInstance(); // Calendar ��ü ����.
			int year = cal.get(Calendar.YEAR);
			String month = (cal.get(Calendar.MONTH) + 1) + "";
			if (month.length() == 1) {
				month = "0" + month;
			}
			int day = cal.get(Calendar.DATE);
			System.out.println(year + "" + month + "" + day);
			String date = year + "" + month + "" + day;
			search.setAtt_dd(date);
		} else {
			att_day = att_day.replace("/", "");
			search.setAtt_dd(att_day);
		}
		model.addAttribute("att_day", search.getAtt_dd());
		model.addAttribute("alldlist", service.att_alldlist(search));
	}

	@RequestMapping(value = "/att_mlist", method = RequestMethod.GET) // �����
																		// ��
																		// ���³���
																		// ��ȸ
	public void att_mlistGET(@ModelAttribute("search") AttendanceSearchVO search, Model model, HttpSession session)
			throws Exception {

		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("emp_nm", emp_nm);

		model.addAttribute("msg_count", service2.msg_new_count(mem_id));
		String att_day = search.getAtt_mm();

		if (att_day == null) {
			Calendar cal = Calendar.getInstance(); // Calendar ��ü ����.
			int year = cal.get(Calendar.YEAR);
			String month = (cal.get(Calendar.MONTH) + 1) + "";
			if (month.length() == 1) {
				month = "0" + month;
			}
			String date = year + "" + month;
			search.setAtt_mm(date);
		} else {
			att_day = att_day.replace("/", "");
			search.setAtt_mm(att_day);
		}
		model.addAttribute("att_day", search.getAtt_mm());
		model.addAttribute("att_mm_list", service.att_workMM());
		model.addAttribute("att_mlist", service.att_mlist(search));
	}

	@RequestMapping(value = "/att_registVaction", method = RequestMethod.GET)
	public void att_registVacationGET(Model model, HttpSession session) throws Exception {

		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		String mem_aut_cd = (String) session.getAttribute("mem_aut_cd");
		model.addAttribute("mem_aut_cd", mem_aut_cd);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("emp_nm", emp_nm);

		model.addAttribute("msg_count", service2.msg_new_count(mem_id));

		model.addAttribute("list", service.att_selectList());

	}

	@RequestMapping(value = "/att_registVaction", method = RequestMethod.POST)
	public String att_registVacationPOST(Att_Vat_DtVO vo, Model model, RedirectAttributes ratt, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int chk = service.emp_vatcation(vo);
		System.out.println(chk);
		if (chk > 0) {
			out.println("<script>");
			out.println("alert('휴가일이 겹칩니다.');");
			out.println("location.href='/attendance/att_registVaction';");
			out.println("</script>");
			out.close();
		}return "redirect:/attendance/att_registVaction";


	}

}
