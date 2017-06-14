package kosta.koggiri.admin_emp.persistence;

import java.util.List;

import kosta.koggiri.admin_emp.domain.Admin_MemberVO;
import kosta.koggiri.admin_emp.domain.Dept_TypeVO;
import kosta.koggiri.admin_emp.domain.EmpInfo_AdminVO;
import kosta.koggiri.admin_emp.domain.EmpVO;
import kosta.koggiri.admin_emp.domain.H_CalendarVO;
import kosta.koggiri.admin_emp.domain.H_ImportantVO;
import kosta.koggiri.admin_emp.domain.H_NoticeVO;
import kosta.koggiri.admin_emp.domain.Pos_TypeVO;
import kosta.koggiri.admin_emp.domain.Res_TypeVO;
import kosta.koggiri.admin_emp.domain.SearchVO;
import kosta.koggiri.admin_emp.domain.SearchedEmpVO;

public interface AdminDAO {
	public List<SearchedEmpVO> selectList(SearchVO search)throws Exception;
	
	public void insertEmp(EmpVO vo)throws Exception;
	
	public String findEmpid(EmpVO vo)throws Exception;
	
	public void tempPass(EmpVO vo)throws Exception;
	
	public void tempPassUpdate(Admin_MemberVO advo)throws Exception;
	
	public EmpVO mainEmp(EmpVO vo)throws Exception;
	
	public void updateAtt(String emp_id)throws Exception;
	
	public void updateLev(String emp_id)throws Exception;
	
	public List<EmpVO> searchEmp(EmpVO vo)throws Exception;
	public List<EmpVO> searchatt_Emp(EmpVO vo)throws Exception;
	
	public List<H_NoticeVO> list_notice() throws Exception; 
	
	public List<H_ImportantVO> list_important() throws Exception;
	
	public List<H_CalendarVO> list_calendar(String emp_id) throws Exception;
	
	public List<Res_TypeVO> res_info() throws Exception;	
	public List<Dept_TypeVO> dept_info() throws Exception; //퇴직코드	
	public List<Pos_TypeVO> pos_info() throws Exception; //퇴직코드	
	

	public void update_Personnel(EmpInfo_AdminVO vo) throws Exception; //인사이동
	
	
	public void update_modifyInformation_addr(EmpInfo_AdminVO vo) throws Exception; //정보변경
	public void update_modifyInformation_tel(EmpInfo_AdminVO vo) throws Exception; //정보변경
	public void update_modifyInformation_email(EmpInfo_AdminVO vo) throws Exception; //정보변경


	public void update_resign(EmpInfo_AdminVO vo) throws Exception; //퇴직
	public void insert_resign(EmpInfo_AdminVO vo) throws Exception; //퇴직
	
}
