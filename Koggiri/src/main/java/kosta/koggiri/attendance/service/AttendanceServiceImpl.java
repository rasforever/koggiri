package kosta.koggiri.attendance.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kosta.koggiri.attendance.domain.Att_Emp_InfoVO;
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



}