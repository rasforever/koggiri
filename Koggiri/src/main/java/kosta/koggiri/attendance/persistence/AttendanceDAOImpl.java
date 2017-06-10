package kosta.koggiri.attendance.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.attendance.domain.Emp_InfoVO;

public class AttendanceDAOImpl implements AttendanceDAO{
	
	@Inject
	private SqlSession session;

	private static String namespace = "kosta.koggiri.mapper.AttendanceMapper";

	@Override
	public Emp_InfoVO einfo_select(String emp_id) throws Exception {
		return session.selectOne(namespace + ".einfo_select", emp_id);
	}

	@Override
	public List<AttendanceVO> att_dlit(String emp_id) throws Exception {
		return session.selectList(namespace + ".att_dlit");
	}

}
