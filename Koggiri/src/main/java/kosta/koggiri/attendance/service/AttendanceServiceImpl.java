package kosta.koggiri.attendance.service;

import java.util.List;

import javax.inject.Inject;

import kosta.koggiri.attendance.persistence.AttendanceDAO;
import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.attendance.domain.Att_Emp_InfoVO;

public class AttendanceServiceImpl implements AttendanceService{
	
	@Inject
	private AttendanceDAO dao;

	@Override
	public Att_Emp_InfoVO einfo_select(String emp_id) throws Exception {
		return dao.einfo_select(emp_id);
	}

	@Override
	public List<AttendanceVO> att_dlit(String emp_id) throws Exception {
		return dao.att_dlit(emp_id);
	}
	

}
