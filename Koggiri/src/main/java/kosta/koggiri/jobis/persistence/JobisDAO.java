package kosta.koggiri.jobis.persistence;

import java.util.List;

import kosta.koggiri.jobis.domain.Jobis_EmpVO;

public interface JobisDAO {
	
	public List<Jobis_EmpVO> all_emplist() throws Exception;
	public List<Jobis_EmpVO> all_attendlist() throws Exception; 
	public List<Jobis_EmpVO> all_approvalcheck() throws Exception;
	
	public List<Jobis_EmpVO> every_emp ()throws Exception;

}
