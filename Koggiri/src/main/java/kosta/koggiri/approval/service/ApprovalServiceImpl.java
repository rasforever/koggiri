package kosta.koggiri.approval.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.koggiri.approval.domain.AppTypeVO;
import kosta.koggiri.approval.domain.ApprovalSearchVO;
import kosta.koggiri.approval.domain.ApprovalVO;
import kosta.koggiri.approval.domain.DeptVO;
import kosta.koggiri.approval.domain.Emp_InfoVO;
import kosta.koggiri.approval.domain.SearchCriteria;
import kosta.koggiri.approval.persistence.ApprovalDAO;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Inject
	private ApprovalDAO dao;

	@Transactional
	@Override
	public void regist(ApprovalVO approval) throws Exception {
		dao.create(approval);
		
		String app_id = approval.getApp_id();
		String[] files = approval.getFiles();

		if (files == null) {
			return;
		}
		for (String fileName : files) {
			dao.addAttach(fileName, app_id);
		}

	}

	@Override
	public ApprovalVO read(String app_id) throws Exception {
		return dao.read(app_id);
	}

	@Transactional
	@Override
	public void modify(ApprovalVO approval) throws Exception {
		dao.update(approval);
		String app_id = approval.getApp_id();

		dao.deleteAttach(app_id);

		String[] files = approval.getFiles();

		if (files == null) {
			return;
		}

		for (String fileName : files) {
			dao.replaceAttach(fileName, app_id);
		}
	}

	@Transactional
	@Override
	public void remove(String app_id) throws Exception {
		dao.deleteAttach(app_id);
		dao.delete(app_id);
	}

	@Override
	public List<ApprovalVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<AppTypeVO> appty_select() throws Exception {
		return dao.appty_select();
	}

	@Override
	public List<DeptVO> dept_select() throws Exception {
		return dao.dept_select();
	}

	@Override
	public Emp_InfoVO einfo_select(String emp_id) throws Exception {
		return dao.einfo_select(emp_id);
	}

	@Override
	public List<ApprovalVO> listSearchCriteria(ApprovalSearchVO search) throws Exception {
		return dao.listSearch(search);
	}

	@Override
	public int listSearchCount(ApprovalSearchVO search) throws Exception {
		return dao.listSearchCount(search);
	}

	@Override
	public List<String> getAttach(String emp_id) throws Exception {
		return dao.getAttach(emp_id);
	}

	

}
