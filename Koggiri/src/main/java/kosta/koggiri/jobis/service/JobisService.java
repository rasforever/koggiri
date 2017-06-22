package kosta.koggiri.jobis.service;


import java.util.List;

import kosta.koggiri.attendance.domain.AttendanceVO;

public interface JobisService {
	
	public String jobis_content(String input_text)throws Exception; //질문한 글 보내기
	public List<AttendanceVO> test(AttendanceVO vo)throws Exception;
}
