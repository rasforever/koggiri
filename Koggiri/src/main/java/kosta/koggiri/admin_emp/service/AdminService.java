package kosta.koggiri.admin_emp.service;

import java.util.List;

import kosta.koggiri.admin_emp.domain.Admin_MemberVO;
import kosta.koggiri.admin_emp.domain.App_SearchVO;
import kosta.koggiri.admin_emp.domain.Dept_TypeVO;
import kosta.koggiri.admin_emp.domain.EmpInfo_AdminVO;
import kosta.koggiri.admin_emp.domain.EmpVO;
import kosta.koggiri.admin_emp.domain.H_CalendarVO;
import kosta.koggiri.admin_emp.domain.H_ImportantVO;
import kosta.koggiri.admin_emp.domain.H_NoticeVO;
import kosta.koggiri.admin_emp.domain.Per_AppVO;
import kosta.koggiri.admin_emp.domain.Pos_TypeVO;
import kosta.koggiri.admin_emp.domain.Res_TypeVO;
import kosta.koggiri.admin_emp.domain.SearchVO;
import kosta.koggiri.admin_emp.domain.SearchedEmpVO;

public interface AdminService {

	public List<SearchedEmpVO> selectList(SearchVO search) throws Exception;
	
	public List<Per_AppVO> select_per(App_SearchVO search)throws Exception; // 인사발령리스트

	public void insertEmp(EmpVO vo) throws Exception;

	public String findEmpid(EmpVO vo) throws Exception;

	public void tempPass(EmpVO vo) throws Exception;

	public void tempPassUpdate(Admin_MemberVO advo) throws Exception;

	public EmpVO mainEmp(EmpVO vo) throws Exception;

	public void updateAtt(String emp_id) throws Exception;

	public void updateLev(String emp_id) throws Exception;

	public List<EmpVO> searchEmp(EmpVO vo) throws Exception;

	public List<EmpVO> searchatt_Emp(EmpVO vo) throws Exception;

	public List<H_NoticeVO> list_notice() throws Exception;  //�������

	public List<H_ImportantVO> list_important() throws Exception;  //�˸����

	public List<H_CalendarVO> list_calendar(String emp_id) throws Exception; //����
	
	public List<Res_TypeVO> res_info() throws Exception; //�����ڵ�	
	public List<Dept_TypeVO> dept_info() throws Exception; //�����ڵ�	
	public List<Pos_TypeVO> pos_info() throws Exception; //�����ڵ�		
	
	public void update_Personnel(EmpInfo_AdminVO vo) throws Exception; //�λ��̵�

	public void update_modifyInformation(EmpInfo_AdminVO vo) throws Exception; //������� �߰� ����
	

	public void update_resign(EmpInfo_AdminVO vo) throws Exception; //����
	

}
