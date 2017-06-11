package kosta.koggiri.attendance.persistence;

import java.util.List;

import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.attendance.domain.Att_Emp_InfoVO;
import kosta.koggiri.attendance.domain.AttendanceSearchVO;

public interface AttendanceDAO {
	
	public Att_Emp_InfoVO einfo_select(String emp_id) throws Exception; //�������

	public List<AttendanceVO> att_dlist(AttendanceVO vo) throws Exception; //���� �� ���³���
	public List<AttendanceVO> att_alldlist(AttendanceSearchVO vo) throws Exception; //����� ���� ���³��� 	
	public List<AttendanceVO> att_mlist(AttendanceSearchVO vo)throws Exception; //�� ����� ���³���
	

}
