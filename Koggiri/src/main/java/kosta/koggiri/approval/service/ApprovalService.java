package kosta.koggiri.approval.service;

import java.util.List;

import kosta.koggiri.approval.domain.AppTypeVO;
import kosta.koggiri.approval.domain.ApprovalSearchVO;
import kosta.koggiri.approval.domain.ApprovalVO;
import kosta.koggiri.approval.domain.DeptVO;
import kosta.koggiri.approval.domain.Emp_InfoVO;
import kosta.koggiri.approval.domain.SearchCriteria;

public interface ApprovalService {
	
	public void regist(ApprovalVO approval) throws Exception;		//insert
	public ApprovalVO read(String app_id) throws Exception;			//한 데이터 읽기
	public void modify(ApprovalVO approval) throws Exception;		//수정하기
	public void remove(String app_id) throws Exception;				//제거하기
	public List<AppTypeVO> appty_select() throws Exception; 		//입력시 문서 종류 가져오기
	public List<DeptVO> dept_select() throws Exception; 			//입력시 부서 가져오기 
	public Emp_InfoVO einfo_select(String emp_id) throws Exception; //개인정보 가져오기

	public void update(ApprovalVO approval) throws Exception;		//승인-부결
	
	public List<ApprovalVO> listSearchCriteria(ApprovalSearchVO search) throws Exception;
	public int listSearchCount(ApprovalSearchVO search) throws Exception;
	
	public List<String> getAttach(String emp_id)throws Exception;
	

}
