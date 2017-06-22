package kosta.koggiri.attendance.service;

import java.util.List;

import kosta.koggiri.attendance.domain.Att_EmpVO;
import kosta.koggiri.attendance.domain.Att_Emp_InfoVO;
import kosta.koggiri.attendance.domain.Att_VactionVO;
import kosta.koggiri.attendance.domain.Att_Vat_DtVO;
import kosta.koggiri.attendance.domain.AttendanceSearchVO;
import kosta.koggiri.attendance.domain.AttendanceVO;

public interface AttendanceService {
	
	public Att_Emp_InfoVO einfo_select(String emp_id) throws Exception; //���������������
	public List<AttendanceVO> att_dlist(AttendanceVO vo) throws Exception; //���� �� ���³��� 
	public List<AttendanceVO> att_alldlist(AttendanceSearchVO vo) throws Exception; //����� ���� ���³��� 
	public List<AttendanceVO> att_mlist(AttendanceSearchVO vo) throws Exception; //����� �� ���³��� 
	public List<Att_EmpVO> att_selectList() throws Exception;

	public List<AttendanceSearchVO> att_workMM() throws Exception; //�����Ͱ� ������ ��
	
	public int emp_vatcation(Att_Vat_DtVO vo) throws Exception;
	
	public List<Att_EmpVO> att_vacationList() throws Exception;
}
