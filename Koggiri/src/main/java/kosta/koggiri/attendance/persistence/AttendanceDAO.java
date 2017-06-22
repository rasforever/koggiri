package kosta.koggiri.attendance.persistence;

import java.util.List;

import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.admin_emp.domain.SearchVO;
import kosta.koggiri.admin_emp.domain.SearchedEmpVO;
import kosta.koggiri.attendance.domain.Att_EmpVO;
import kosta.koggiri.attendance.domain.Att_Emp_InfoVO;
import kosta.koggiri.attendance.domain.AttendanceSearchVO;

public interface AttendanceDAO {
	
	public Att_Emp_InfoVO einfo_select(String emp_id) throws Exception; //�������

	public List<AttendanceVO> att_dlist(AttendanceVO vo) throws Exception; //���� �� ���³���
	public List<AttendanceVO> att_alldlist(AttendanceSearchVO vo) throws Exception; //����� ���� ���³��� 	
	public List<AttendanceVO> att_mlist(AttendanceSearchVO vo)throws Exception; //�� ����� ���³���	
	public List<Att_EmpVO> att_selectList(Att_EmpVO vo)throws Exception;

	public List<AttendanceSearchVO> att_workMM() throws Exception; //�����Ͱ� ������ ��
	
    public List<AttendanceVO>jobis_search(AttendanceVO vo)throws Exception;//고병휘 jobis 추가
}
