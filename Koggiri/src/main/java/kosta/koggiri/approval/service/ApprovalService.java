package kosta.koggiri.approval.service;

import java.util.List;

import kosta.koggiri.approval.domain.ApprovalVO;

public interface ApprovalService {
	
	public void regist(ApprovalVO approval) throws Exception;
	
	public ApprovalVO read(String app_id) throws Exception;
	
	public void modify(ApprovalVO approval) throws Exception;
	
	public void remove(String app_id) throws Exception;
	
	public List<ApprovalVO> listAll() throws Exception;

}
