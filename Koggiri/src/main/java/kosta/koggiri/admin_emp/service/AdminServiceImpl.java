package kosta.koggiri.admin_emp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.koggiri.admin_emp.domain.Admin_MemberVO;
import kosta.koggiri.admin_emp.domain.App_SearchVO;
import kosta.koggiri.admin_emp.domain.Dept_TypeVO;
import kosta.koggiri.admin_emp.domain.EmpInfo_AdminVO;
import kosta.koggiri.admin_emp.domain.EmpVO;
import kosta.koggiri.admin_emp.domain.H_CalendarVO;
import kosta.koggiri.admin_emp.domain.H_ImportantVO;
import kosta.koggiri.admin_emp.domain.H_NoticeVO;
import kosta.koggiri.admin_emp.domain.Per_AppVO;
import kosta.koggiri.admin_emp.domain.Pos_TypeVO;
import kosta.koggiri.admin_emp.domain.Res_TypeVO;
import kosta.koggiri.admin_emp.domain.SearchVO;
import kosta.koggiri.admin_emp.domain.SearchedEmpVO;
import kosta.koggiri.admin_emp.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	@Override
	public List<SearchedEmpVO> selectList(SearchVO search) throws Exception {
		return dao.selectList(search);
	}

	@Override
	public void insertEmp(EmpVO vo) throws Exception {
		dao.insertEmp(vo);
	}

	@Override
	public String findEmpid(EmpVO vo) throws Exception {
		return dao.findEmpid(vo);
	}

	@Override
	public void tempPass(EmpVO vo) throws Exception {
		dao.tempPass(vo);
	}

	@Override
	public void tempPassUpdate(Admin_MemberVO advo) throws Exception {
		dao.tempPassUpdate(advo);
	}

	@Override
	public EmpVO mainEmp(EmpVO vo) throws Exception {
		return dao.mainEmp(vo);
	}

	@Override
	public void updateLev(String emp_id) throws Exception {
		dao.updateLev(emp_id);

	}

	@Override
	public void updateAtt(String emp_id) throws Exception {
		dao.updateAtt(emp_id);
	}

	@Override
	public List<EmpVO> searchEmp(EmpVO vo) throws Exception {
		return dao.searchEmp(vo);
	}

	@Override
	public List<EmpVO> searchatt_Emp(EmpVO vo) throws Exception {
		return dao.searchatt_Emp(vo);
	}

	@Override
	public List<H_NoticeVO> list_notice() throws Exception {
		return dao.list_notice();
	}

	@Override
	public List<H_ImportantVO> list_important() throws Exception {
		return dao.list_important();
	}

	@Override
	public List<H_CalendarVO> list_calendar(String emp_id) throws Exception {
		return dao.list_calendar(emp_id);
	}

	@Override
	public List<Res_TypeVO> res_info() throws Exception {
		return dao.res_info();
	}

	@Transactional
	@Override
	public void update_resign(EmpInfo_AdminVO vo) throws Exception {
		dao.update_resign(vo);
		dao.insert_resign(vo);

	}

	@Transactional
	@Override
	public void update_modifyInformation(EmpInfo_AdminVO vo) throws Exception {
		if (vo.getAddr() != null) {
			dao.update_modifyInformation_addr(vo);
		}
		if (vo.getTel_no() != null) {
			dao.update_modifyInformation_tel(vo);
		}
		if (vo.getTel_no() != null) {
			dao.update_modifyInformation_email(vo);
		}

	}

	@Override
	public void update_Personnel(EmpInfo_AdminVO vo) throws Exception {
		
			dao.update_Personnel(vo);

	}

	@Override
	public List<Dept_TypeVO> dept_info() throws Exception {
		return dao.dept_info();
	}

	@Override
	public List<Pos_TypeVO> pos_info() throws Exception {
		return dao.pos_info();
	}

	//인사발령리스트
	
	@Override
	public List<Per_AppVO> select_per(App_SearchVO search) throws Exception {
		return dao.select_per(search);
	}

}
