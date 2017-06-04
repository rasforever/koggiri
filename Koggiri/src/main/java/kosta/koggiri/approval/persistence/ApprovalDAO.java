package kosta.koggiri.approval.persistence;

import java.util.List;

import kosta.koggiri.approval.domain.AppTypeVO;
import kosta.koggiri.approval.domain.ApprovalSearchVO;
import kosta.koggiri.approval.domain.ApprovalVO;
import kosta.koggiri.approval.domain.DeptVO;
import kosta.koggiri.approval.domain.Emp_InfoVO;
import kosta.koggiri.approval.domain.SearchCriteria;

public interface ApprovalDAO {
	public void create(ApprovalVO vo) throws Exception;

	public ApprovalVO read(String app_id) throws Exception;

	public void update(ApprovalVO vo) throws Exception;

	public void delete(String app_id) throws Exception;

	public List<AppTypeVO> appty_select() throws Exception; // 입력시 문서 종류 가져오기

	public List<DeptVO> dept_select() throws Exception; // 입력시 부서 가져오기

	public Emp_InfoVO einfo_select(String emp_id) throws Exception; // 개인정보 가져오기

	public List<ApprovalVO> listSearch(ApprovalSearchVO search) throws Exception;

	public int listSearchCount(ApprovalSearchVO search) throws Exception;

	public void addAttach(String fullName, String app_id) throws Exception;

	public List<String> getAttach(String app_id) throws Exception;

	public void deleteAttach(String app_id) throws Exception;

	public void replaceAttach(String fullName, String app_id) throws Exception;

}
