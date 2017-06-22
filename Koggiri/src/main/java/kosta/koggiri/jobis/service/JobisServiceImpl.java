package kosta.koggiri.jobis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.koggiri.admin_emp.persistence.AdminDAO;
import kosta.koggiri.approval.persistence.ApprovalDAO;
import kosta.koggiri.attendance.persistence.AttendanceDAO;
import kosta.koggiri.calendar.persistence.CalendarDAO;
import kosta.koggiri.chart.persistence.ChartDAO;
import kosta.koggiri.document.persistence.Doc_BoardDAO;
import kosta.koggiri.importantboard.persistence.Imp_BoardDAO;
import kosta.koggiri.jobis.domain.Jobis_EmpVO;
import kosta.koggiri.jobis.persistence.JobisDAO;
import kosta.koggiri.login.persistence.LoginDAO;
import kosta.koggiri.msg.persistence.MsgDAO;
import kosta.koggiri.noticeboard.persistence.Noti_BoardDAO;
import kosta.koggiri.task.persistence.TaskDAO;

@Service
public class JobisServiceImpl implements JobisService {

	
	
	@Inject
	private JobisDAO dao_jobis;
	
	@Inject
	private AdminDAO dao_admin;
	
	@Inject
	private ApprovalDAO dao_approval;
	
	@Inject
	private CalendarDAO dao_calendar;
	
	@Inject
	private ChartDAO dao_chart;
	
	@Inject
	private AttendanceDAO dao_attend;
	
	@Inject
	private Doc_BoardDAO dao_document;
	
	@Inject
	private Imp_BoardDAO dao_important;
	
	@Inject
	private LoginDAO dao_login;
		
	@Inject
	private MsgDAO dao_msg;
	
	@Inject
	private Noti_BoardDAO dao_noticeboard;
	
	@Inject
	private TaskDAO dao_task;

	
	
	

	
	@Transactional 
	@Override
	public String jobis_content(String input_text) throws Exception {
		String text = "";
		if (input_text.contains("안녕") || input_text.contains("반가워") || input_text.contains("자비스 안녕")) {
			System.out.println("자비스서비스임플리ㅇㅋ : " + input_text);

			return "네 반갑습니다!";
		} else if (input_text.contains("잘가")) {

			return "꺼져이새끼야";
		} else if (input_text.contains("승현") && input_text.contains("얼굴")) {

			return "원빈은 우선 아니에요.";
		} else if (input_text.matches("야") || input_text.matches("자비스")) {

			return "네 부르셨어요?";
		} else if (input_text.contains("유승현") && input_text.contains("17/6/21") && input_text.contains("출근")) {

		} else if (input_text.contains("전체") && input_text.contains("사원리스트")) {
			List<Jobis_EmpVO> empvo = dao_jobis.all_emplist();
			
			for(int i=0;i<empvo.size();i++){
				String intext = empvo.get(i).getEmp_nm();
				text += intext + "님,\n" + "<br>";
			}

			return text + " 입니다.";
			
		}else if (input_text.contains("전체") && input_text.contains("출근리스트")){
			List<Jobis_EmpVO> attendlist = dao_jobis.all_attendlist();
			
			for(int i=0; i<attendlist.size(); i++){
				
			 String intext	= attendlist.get(i).getEmp_nm()+ " : " + attendlist.get(i).getAtt_time();
			 text += intext +",\n" + "<br>";
				
			}
			return text + " 입니다.";
		}
		else if (input_text.contains("결재") && input_text.contains("기안중")){
			List<Jobis_EmpVO> notyetcheck = dao_jobis.all_approvalcheck();
			
			for(int i=0; i<notyetcheck.size(); i++){
				
			 String intext	= notyetcheck.get(i).getEmp_nm()+ " 님의  " + notyetcheck.get(i).getApp_id() +notyetcheck.get(i).getApp_title() + notyetcheck.get(i).getInput_sysdt();
			 text += intext +",\n" + "<br>";
				
			}
			return text + "미결재상태 입니다.";
		}
		
		return "잘 못 알아들었어요. 다시 입력해 주실래요?";
	}
}
