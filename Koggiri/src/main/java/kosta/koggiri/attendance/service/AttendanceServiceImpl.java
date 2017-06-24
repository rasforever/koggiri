package kosta.koggiri.attendance.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.koggiri.admin_emp.domain.SearchedEmpVO;
import kosta.koggiri.attendance.domain.Att_EmpVO;
import kosta.koggiri.attendance.domain.Att_Emp_InfoVO;
import kosta.koggiri.attendance.domain.Att_VactionVO;
import kosta.koggiri.attendance.domain.Att_Vat_DtVO;
import kosta.koggiri.attendance.domain.AttendanceSearchVO;
import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.attendance.persistence.AttendanceDAO;

@Service
public class AttendanceServiceImpl implements AttendanceService{

	@Inject
	private AttendanceDAO dao;

	@Override
	public Att_Emp_InfoVO einfo_select(String emp_id) throws Exception {
		return dao.einfo_select(emp_id);
	}

	@Override
	public List<AttendanceVO> att_dlist(AttendanceVO vo) throws Exception {
		return dao.att_dlist(vo);
	}
	
	@Override
	public List<AttendanceVO> att_alldlist(AttendanceSearchVO vo) throws Exception {
		return dao.att_alldlist(vo);
	}
	
	@Override
	public List<AttendanceVO> att_mlist(AttendanceSearchVO vo) throws Exception {
		return dao.att_mlist(vo);
	}

	@Override
	public List<AttendanceSearchVO> att_workMM() throws Exception {
		return dao.att_workMM();
	}

	@Override
	public List<Att_EmpVO> att_selectList() throws Exception {
		return dao.att_selectList();
	}
	@Transactional
	@Override
	public int emp_vatcation(Att_Vat_DtVO vo) throws Exception {
		vo.setAtt_ed_dt(vo.getAtt_ed_dt().replace("/",""));
		vo.setAtt_st_dt(vo.getAtt_st_dt().replace("/",""));
		int chk_count  = dao.emp_vat_ct(vo);
		System.out.println(chk_count);
		if (chk_count == 0){
			 dao.emp_vatcation(vo);				
		}
		return	chk_count;
	}

	@Override
	public List<Att_EmpVO> att_vacationList() throws Exception {
		return dao.att_vacationList();
	}

	@Override
	public void att_deletevat(Att_Vat_DtVO vo) throws Exception {
		dao.att_deletevat(vo);	
	}
}
