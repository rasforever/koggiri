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
		Jobis_EmpVO vo = new Jobis_EmpVO();
		List<Jobis_EmpVO> emp = dao_jobis.all_emplist(); // 전체 사원 아이디,이름
		List<Jobis_EmpVO> all_emp = dao_jobis.every_emp();// 전체 사원의 모든 것.

		for (int j = 0; j < all_emp.size(); j++) {

			if (input_text.contains("안녕") || input_text.contains("반가워") || input_text.contains("자비스 안녕")) {

				return "네 반갑습니다!";
			} else if (input_text.contains("잘가")) {

				return "꺼져이새끼야";
			} else if (input_text.contains("서창훈") && input_text.contains("어떤")) {

				return "빽바지를 즐겨입으시는 프로강의러이십니다.";
			} else if (input_text.contains("승현") && input_text.contains("얼굴")) {

				return "원빈은 우선 아니에요.";
			} else if (input_text.matches("야") || input_text.matches("자비스")) {

				return "네 부르셨어요?";
			} else if (input_text.contains("유승현") && input_text.contains("17/6/21") && input_text.contains("출근")) {

			} else if (input_text.contains("전체") && input_text.contains("사원리스트")) {
				List<Jobis_EmpVO> empvo = dao_jobis.all_emplist();

				for (int i = 0; i < empvo.size(); i++) {
					String intext = empvo.get(i).getEmp_nm();
					text += "- " + intext + "님,\n" + "<br>";
				}

				return text + " 입니다.";

			} else if (input_text.contains("전체") && input_text.contains("출근리스트")) {
				List<Jobis_EmpVO> attendlist = dao_jobis.all_attendlist();

				for (int i = 0; i < attendlist.size(); i++) {

					String intext = attendlist.get(i).getEmp_nm() + " : " + attendlist.get(i).getAtt_time();
					text += intext + ",\n" + "<br>";

				}
				return text + " 입니다.";
			} else if (input_text.contains("결재") && input_text.contains("미결재")) {
				List<Jobis_EmpVO> notyetcheck = dao_jobis.all_approvalcheck();

				for (int i = 0; i < notyetcheck.size(); i++) {

					String intext = "- " + notyetcheck.get(i).getEmp_nm() + " 님의  " + notyetcheck.get(i).getApp_id()
							+ " " + notyetcheck.get(i).getApp_title() + " " + notyetcheck.get(i).getInput_sysdt();
					text += intext + ",\n" + "<br>";

				}
				return text + "미결재상태 입니다.";
			} else if (input_text.contains(all_emp.get(j).getEmp_nm()) && input_text.contains("출근시간")) {

				System.out.println(all_emp.get(j).getAtt_time());
				if (all_emp.get(j).getAtt_time() != null) {
					return all_emp.get(j).getEmp_nm() + "님의 출근시간은  " + all_emp.get(j).getAtt_time() + " 입니다.";
				} else {
					return all_emp.get(j).getEmp_nm() + "님은 아직 출근하지 않았습니다.";
				}
			} else if (input_text.contains(all_emp.get(j).getEmp_nm()) && input_text.contains("퇴근시간")) {

				if (all_emp.get(j).getLea_time() != null) {
					return all_emp.get(j).getEmp_nm() + "님의 퇴근시간은  " + all_emp.get(j).getLea_time() + " 입니다.";
				} else {
					return all_emp.get(j).getEmp_nm() + "님은 아직 퇴근하지 않았습니다.";
				}
			} else if (input_text.contains(all_emp.get(j).getEmp_nm()) && input_text.contains("직급")) {

				return all_emp.get(j).getEmp_nm() + "님의 직급은  " + all_emp.get(j).getPos_nm() + " 입니다.";

			} else if (input_text.contains(all_emp.get(j).getEmp_nm()) && input_text.contains("부서")) {

				return all_emp.get(j).getEmp_nm() + "님의 부서는  " + all_emp.get(j).getDept_nm() + " 입니다.";

			} else if (input_text.contains("네이버") && input_text.contains("검색") ){
				
				
				String b = input_text.substring(input_text.indexOf(" ")+1, input_text.length());
				System.out.println(b);
				String c = b.substring(0 , b.indexOf(" "));
				System.out.println(c);
			
				return 	"잘 모르겠으니 여기서 검색해드릴게요 ~ <a href =\"javascript:;\"onclick=\"window.open('https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query="
						+ c + "');\">요기 클릭!</a>";
			}

		}
		
		
	
		return 	"저장된 키워드가 없습니다. 다시 입력해 보실래요?";
	}

}
