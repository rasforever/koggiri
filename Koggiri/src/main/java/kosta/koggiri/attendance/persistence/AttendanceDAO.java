package kosta.koggiri.attendance.persistence;

import java.util.List;

import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.attendance.domain.Att_Emp_InfoVO;

public interface AttendanceDAO {
	
	public Att_Emp_InfoVO einfo_select(String emp_id) throws Exception; //사원정보

	public List<AttendanceVO> att_dlist(AttendanceVO vo) throws Exception; //본인 근태내역 
	
	public List<AttendanceVO> att_mlist(AttendanceVO vo)throws Exception; //월 전 사원 근태내역
	

}
