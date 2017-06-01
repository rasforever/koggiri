package kosta.koggiri.approval.persistence;

import java.util.List;

import kosta.koggiri.approval.domain.ApprovalVO;

public interface ApprovalDAO {
	public void create(ApprovalVO vo) throws Exception;
	  public ApprovalVO read(String app_id) throws Exception;
	  public void update(ApprovalVO vo) throws Exception;
	  public void delete(String app_id) throws Exception;
	  public List<ApprovalVO> listAll() throws Exception;

}
