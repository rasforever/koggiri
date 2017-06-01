package kosta.koggiri.approval.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.koggiri.approval.domain.ApprovalVO;
import kosta.koggiri.approval.persistence.ApprovalDAO;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Inject
	private ApprovalDAO dao;
	
	@Transactional
	@Override
	public void regist(ApprovalVO approval) throws Exception {
		dao.create(approval);

	}

	@Transactional
	@Override
	public ApprovalVO read(String app_id) throws Exception {
		//dao.updateViewCnt(app_id);
		return dao.read(app_id);
	}
	
	@Transactional
	@Override
	public void modify(ApprovalVO approval) throws Exception {
		dao.update(approval);
		
		String app_id = approval.getApp_id();
		
//		dao.deleteAttach(bno);

	}
	
	@Transactional
	@Override
	public void remove(String app_id) throws Exception {
//		dao.deleteAttach(app_id);
		dao.delete(app_id);

	}

	@Override
	public List<ApprovalVO> listAll() throws Exception {
		return dao.listAll();
	}


}
