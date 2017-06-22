package kosta.koggiri.jobis.service;



import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.attendance.persistence.AttendanceDAO;


@Service
public class JobisServiceImpl implements JobisService {
	
	@Inject
	private AttendanceDAO dao;
	
	
	@Override
	public List<AttendanceVO> test(AttendanceVO vo)throws Exception{
		
		return dao.jobis_search(vo);

	}
	

	@Override
	public String jobis_content(String input_text) throws Exception {

		if (input_text.contains("안녕") || input_text.contains("반가워") || input_text.contains("자비스 안녕")) {
			System.out.println("자비스서비스임플리ㅇㅋ : " + input_text);

			return "네 반갑습니다!";
		} else if (input_text.contains("잘가")) {

			return "꺼져이새끼야";
		} else if (input_text.contains("승현")) {

			return "원빈은 우선 아니에요.";
		} else if (input_text.matches("야") || input_text.matches("자비스")) {

			return "네 부르셨어요?";
		} 
		else if (input_text.contains("유승현") && input_text.contains("17/6/21") && input_text.contains("출근")) {
			
		
			
		} 


		return "잘 못 알아들었어요. 다시 입력해 주실래요?";
	}
}
