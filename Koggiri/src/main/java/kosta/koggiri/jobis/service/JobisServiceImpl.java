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
import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.domain.Doc_PageMaker;
import kosta.koggiri.document.domain.Doc_SearchCriteria;
import kosta.koggiri.document.persistence.Doc_BoardDAO;
import kosta.koggiri.importantboard.domain.Imp_BoardVO;
import kosta.koggiri.importantboard.persistence.Imp_BoardDAO;
import kosta.koggiri.jobis.domain.Jobis_EmpVO;
import kosta.koggiri.jobis.persistence.JobisDAO;
import kosta.koggiri.login.persistence.LoginDAO;
import kosta.koggiri.msg.persistence.MsgDAO;
import kosta.koggiri.noticeboard.domain.Noti_BoardVO;
import kosta.koggiri.noticeboard.persistence.Noti_BoardDAO;
import kosta.koggiri.task.persistence.TaskDAO;

@Service
public class JobisServiceImpl implements JobisService {

	// 자비스 자체
	@Inject
	private JobisDAO dao_jobis;

	// 사원정보
	@Inject
	private AdminDAO dao_admin;

	// 결재
	@Inject
	private ApprovalDAO dao_approval;

	// 일정
	@Inject
	private CalendarDAO dao_calendar;

	// 근태
	@Inject
	private AttendanceDAO dao_attend;

	// 문서
	@Inject
	private Doc_BoardDAO dao_document;

	// 알립니다
	@Inject
	private Imp_BoardDAO dao_important;

	// 공지
	@Inject
	private Noti_BoardDAO dao_noticeboard;

	// 업무
	@Inject
	private TaskDAO dao_task;

	private Doc_SearchCriteria cri;

	@Transactional
	@Override
	public String jobis_content(String input_text) throws Exception {

		String text = "";
		Jobis_EmpVO vo = new Jobis_EmpVO();
		List<Jobis_EmpVO> all_emp = dao_jobis.all_emplist(); // 전체 사원 아이디,이름

		for (int j = 0; j < all_emp.size(); j++) {
			// 인사
			if (input_text.contains("안녕") || input_text.contains("반가워") || input_text.contains("자비스 안녕")) {
				text = "네 안녕하세요" + all_emp.get(j).getEmp_nm() + "님 반갑습니다. 오늘도 활기차게 간다 간다 뿅간다.";
				return text;
				// 인사
			} else if (input_text.contains("잘가")) {
				text = all_emp.get(j).getEmp_nm() + "님? 가라고요? 그래요.. ";
				return text;
				// 강사님 취미
			} else if (input_text.contains("서창훈") && input_text.contains("어떤")) {
				return "백바지를 즐겨입으시는 PRO L.E.C.T.U.R.E.R. 입니다.";
				// 사람들 평가
			} else if (input_text.contains(all_emp.get(j).getEmp_nm()) && input_text.contains("얼굴")) {
				return "인간의 형상은 아닌거 같아요.";

				// 자비스 호출
			} else if (input_text.matches("야") || input_text.matches("자비스")) {
				return "네 부르셨어요?";
				// 전 사원 리스트 조회
			} else if (input_text.contains("전체") && input_text.contains("사원리스트")) {
				List<Jobis_EmpVO> empvo = dao_jobis.all_emplist();

				for (int i = 0; i < empvo.size(); i++) {
					String intext = empvo.get(i).getEmp_nm();
					text += "- " + intext + "님,\n" + "<br>";
				}
				return text + " 입니다.";
				// 전 사원 출근 리스트
			} else if (input_text.contains("전체") && input_text.contains("출근리스트")) {
				List<Jobis_EmpVO> attendlist = dao_jobis.all_attendlist();
				if (attendlist.size() == 0) {
					return text + "그 누구도 출근하지 않았다.";

				} else {
					for (int i = 0; i < attendlist.size(); i++) {
						String intext = attendlist.get(i).getEmp_nm() + " : " + attendlist.get(i).getAtt_time();
						text += intext + ",\n" + "<br>";
					}
					return text + " 입니다.";
				}
				// 결재된 문서 확인
			} else if (input_text.contains("결재") && input_text.contains("미결재")) {
				List<Jobis_EmpVO> notyetcheck = dao_jobis.all_approvalcheck();
				for (int i = 0; i < notyetcheck.size(); i++) {
					String intext = "- " + notyetcheck.get(i).getEmp_nm() + " 님의  " + notyetcheck.get(i).getApp_id()
							+ " " + notyetcheck.get(i).getApp_title() + " " + notyetcheck.get(i).getInput_sysdt();
					text += intext + ",\n" + "<br>";
				}
				return text + "미결재상태 입니다.";
				//
			} else if (input_text.contains(all_emp.get(j).getEmp_nm())) {

				Jobis_EmpVO emp = dao_jobis.every_emp(all_emp.get(j).getEmp_id());// 전체
																					// 사원의
																					// 모든
																					// 것.
				if (input_text.contains("출근시간")) {
					if (emp.getAtt_time() != null) {
						return emp.getEmp_nm() + "님의 출근시간은  " + emp.getAtt_time() + " 입니다.";
					} else {
						return emp.getEmp_nm() + "님은 아직 출근하지 않았습니다.";
					}
				} else if (input_text.contains("퇴근시간")) {
					if (emp.getLea_time() != null) {
						return emp.getEmp_nm() + "님의 퇴근시간은  " + emp.getLea_time() + " 입니다.";
					} else {
						return emp.getEmp_nm() + "님은 아직 퇴근하지 않았습니다.";
					}
				} else if (input_text.contains("직급")) {
					return emp.getEmp_nm() + "님의 직급은  " + emp.getPos_nm() + " 입니다.";
				} else if (input_text.contains("부서")) {
					return emp.getEmp_nm() + "님의 부서는  " + emp.getDept_nm() + " 입니다.";
				} else {
					return "알려드릴 수 없어요. 비밂♡";
				}
			} else if (input_text.contains("네이버") && input_text.contains("검색")) {

				String b = input_text.substring(input_text.indexOf(" ") + 1, input_text.length());
				System.out.println(b);
				String c = b.substring(0, b.indexOf(" "));
				System.out.println(c);

				return "잘 모르겠으니 여기서 검색해드릴게요 ~ <a href =\"javascript:;\"onclick=\"window.open('https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query="
						+ c + "');\">요기 클릭!</a>";
			} else if (input_text.contains("알립니다")) {
				if (input_text.contains("검색")) {
					String b = input_text.substring(input_text.indexOf(" ") + 1, input_text.length());		
					String c = b.substring(0, b.indexOf(" "));
					Imp_BoardVO impBVO = new Imp_BoardVO();
					impBVO.setI_TITLE(c);
					impBVO.setI_CONTENT(c);
					int ck_imp = dao_important.SearchId_count(impBVO);
					if (ck_imp == 0){
						return "그런건 없어...";
					} else if(ck_imp == 1){
						int dao_impid = dao_important.SearchId(impBVO);			
						return "드루와 ~ <a href =\"javascript:;\"onclick=\"opener.parent.location='../importantboard/readPage?i_ID="+ dao_impid + "';\"\"\">요기 클릭!</a>";
						
					} else{
						return "드루와 ~ <a href =\"javascript:;\"onclick=\"opener.parent.location='http://localhost:8081/importantboard/listPage';\"\"\">요기 클릭!</a>";
					}
					
				}
			}
			else if (input_text.contains("문서함")) {
				if (input_text.contains("검색")) {
					String b = input_text.substring(input_text.indexOf(" ") + 1, input_text.length());		
					String c = b.substring(0, b.indexOf(" "));
					Doc_BoardVO DocBVO = new Doc_BoardVO();
					DocBVO.setF_title(c);
					DocBVO.setF_content(c);
					int ck_doc = dao_document.SearchId_count(DocBVO);
					if (ck_doc == 0){
						return "해당하는 문서글이 존재하지 않습니다.";
					} else if(ck_doc == 1){
						int dao_documentid = dao_document.SearchId(DocBVO);			
						return "드루와 ~ <a href =\"javascript:;\"onclick=\"opener.parent.location='../document/readPage?f_id="+ dao_documentid + "';\"\"\">요기 클릭!</a>";
						
					} else{
						return "드루와 ~ <a href =\"javascript:;\"onclick=\"opener.parent.location='http://localhost:8081/document/list;\"\"\">요기 클릭!</a>";
					}
					
				}
			}
			else if (input_text.contains("공지")) {
				if (input_text.contains("검색")) {
					String b = input_text.substring(input_text.indexOf(" ") + 1, input_text.length());		
					String c = b.substring(0, b.indexOf(" "));
					Noti_BoardVO NOTIBVO = new Noti_BoardVO();
					NOTIBVO.setN_TITLE(c);
					NOTIBVO.setN_CONTENT(c);
					int ck_noti = dao_noticeboard.SearchId_count(NOTIBVO);
					if (ck_noti == 0){
						return "해당하는 공지 글이 존재하지 않습니다.";
					} else if(ck_noti == 1){
						int dao_notiboardid = dao_noticeboard.SearchId(NOTIBVO);			
						return "드루와 ~ <a href =\"javascript:;\"onclick=\"opener.parent.location='../noticeboard/readPage?n_ID="+ dao_notiboardid + "';\"\"\">요기 클릭!</a>";
						
					} else{
						return "드루와 ~ <a href =\"javascript:;\"onclick=\"opener.parent.location='http://localhost:8081/noticeboard/listPage;\"\"\">요기 클릭!</a>";
					}
					
				}
			}
		}

		return "저장된 키워드가 없습니다. 다시 입력해 보실래요?";
	}

}
