package kosta.koggiri.attendance.persistence;

import java.util.List;

import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.attendance.domain.Att_Emp_InfoVO;
import kosta.koggiri.attendance.domain.AttendanceSearchVO;

public interface AttendanceDAO {
	
	public Att_Emp_InfoVO einfo_select(String emp_id) throws Exception; //사원정보

	public List<AttendanceVO> att_dlist(AttendanceVO vo) throws Exception; //본인 월 근태내역
	public List<AttendanceVO> att_alldlist(AttendanceSearchVO vo) throws Exception; //전사원 당일 근태내역 	
	public List<AttendanceVO> att_mlist(AttendanceSearchVO vo)throws Exception; //월 전사원 근태내역	

	public List<AttendanceSearchVO> att_workMM() throws Exception; //데이터가 생성된 달
	

}
