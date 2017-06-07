package kosta.koggiri.admin_emp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kosta.koggiri.admin_emp.domain.Admin_MemberVO;
import kosta.koggiri.admin_emp.domain.EmpVO;
import kosta.koggiri.admin_emp.domain.SearchVO;
import kosta.koggiri.admin_emp.domain.SearchedEmpVO;
import kosta.koggiri.admin_emp.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO dao;
	
	@Override
	public List<SearchedEmpVO> selectList(SearchVO search) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList(search);
	}

	@Override
	public void insertEmp(EmpVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertEmp(vo);
	}

	@Override
	public String findEmpid(EmpVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.findEmpid(vo);
	}

	@Override
	public void tempPass(EmpVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.tempPass(vo);
	}

	@Override
	public void tempPassUpdate(Admin_MemberVO advo) throws Exception {
		// TODO Auto-generated method stub
		dao.tempPassUpdate(advo);
	}

	@Override
	public EmpVO mainEmp(EmpVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.mainEmp(vo);
	}
	
}
