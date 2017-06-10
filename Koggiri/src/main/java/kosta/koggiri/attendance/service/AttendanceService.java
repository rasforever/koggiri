package kosta.koggiri.attendance.service;

import java.util.List;

import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.attendance.domain.Att_Emp_InfoVO;

public interface AttendanceService {	

	public Att_Emp_InfoVO einfo_select(String emp_id) throws Exception; //사원정보가져오기
	public List<AttendanceVO> att_dlit(String emp_id) throws Exception; //본인 근태내역 

}
