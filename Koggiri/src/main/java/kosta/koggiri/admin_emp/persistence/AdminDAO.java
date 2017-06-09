package kosta.koggiri.admin_emp.persistence;

import java.util.List;

import kosta.koggiri.admin_emp.domain.Admin_MemberVO;
import kosta.koggiri.admin_emp.domain.EmpVO;
import kosta.koggiri.admin_emp.domain.SearchVO;
import kosta.koggiri.admin_emp.domain.SearchedEmpVO;

public interface AdminDAO {
	public List<SearchedEmpVO> selectList(SearchVO search)throws Exception;
	
	public void insertEmp(EmpVO vo)throws Exception;
	
	public String findEmpid(EmpVO vo)throws Exception;
	
	public void tempPass(EmpVO vo)throws Exception;
	
	public void tempPassUpdate(Admin_MemberVO advo)throws Exception;
	
	public EmpVO mainEmp(EmpVO vo)throws Exception;
	
	public void insertAtt(String emp_id)throws Exception;
	
	public void updateLev(String emp_id)throws Exception;
	
}
