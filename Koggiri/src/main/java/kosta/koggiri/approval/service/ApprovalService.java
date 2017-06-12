package kosta.koggiri.approval.service;

import java.util.List;

import kosta.koggiri.approval.domain.AppTypeVO;
import kosta.koggiri.approval.domain.ApprovalSearchVO;
import kosta.koggiri.approval.domain.ApprovalVO;
import kosta.koggiri.approval.domain.DeptVO;
import kosta.koggiri.approval.domain.Emp_InfoVO;

public interface ApprovalService {
	
	public void regist(ApprovalVO approval) throws Exception;		//insert
	public ApprovalVO read(String app_id) throws Exception;			//
	public void modify(ApprovalVO approval) throws Exception;		//
	public void remove(String app_id) throws Exception;				//
	public List<AppTypeVO> appty_select() throws Exception; 		//
	public List<DeptVO> dept_select() throws Exception; 			//
	public Emp_InfoVO einfo_select(String emp_id) throws Exception; //

	public void update(ApprovalVO approval) throws Exception;		//
	
	public List<ApprovalVO> listSearchCriteria(ApprovalSearchVO search) throws Exception;
	public int listSearchCount(ApprovalSearchVO search) throws Exception;
	
	public List<String> getAttach(String emp_id)throws Exception;
	

}
