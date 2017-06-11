package kosta.koggiri.approval.persistence;

import java.util.List;

import kosta.koggiri.approval.domain.AppTypeVO;
import kosta.koggiri.approval.domain.ApprovalSearchVO;
import kosta.koggiri.approval.domain.ApprovalVO;
import kosta.koggiri.approval.domain.DeptVO;
import kosta.koggiri.approval.domain.Emp_InfoVO;

public interface ApprovalDAO {
	public void create(ApprovalVO vo) throws Exception;

	public ApprovalVO read(String app_id) throws Exception;

	public void update(ApprovalVO vo) throws Exception;

	public void delete(String app_id) throws Exception;

	public List<AppTypeVO> appty_select() throws Exception; //
	public List<DeptVO> dept_select() throws Exception; //

	public Emp_InfoVO einfo_select(String emp_id) throws Exception; //

	public void updateAPP(ApprovalVO vo) throws Exception; //

	public List<ApprovalVO> listSearch(ApprovalSearchVO search) throws Exception;

	public int listSearchCount(ApprovalSearchVO search) throws Exception;

	public void addAttach(String fullName, String app_id) throws Exception;

	public List<String> getAttach(String app_id) throws Exception;

	public void deleteAttach(String app_id) throws Exception;

	public void replaceAttach(String fullName, String app_id) throws Exception;

}
