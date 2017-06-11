package kosta.koggiri.attendance.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.attendance.domain.Att_Emp_InfoVO;
import kosta.koggiri.attendance.domain.AttendanceSearchVO;

@Repository
public class AttendanceDAOImpl implements AttendanceDAO{
	
	@Inject
	private SqlSession session;

	private static String namespace = "kosta.koggiri.mapper.AttendanceMapper";

	@Override
	public Att_Emp_InfoVO einfo_select(String emp_id) throws Exception {
		return session.selectOne(namespace + ".einfo_select", emp_id);
	}

	@Override
	public List<AttendanceVO> att_dlist(AttendanceVO vo) throws Exception { //본인 월 근태내역
		return session.selectList(namespace + ".att_dlist", vo);
	}
	
	@Override
	public List<AttendanceVO> att_alldlist(AttendanceSearchVO vo) throws Exception { //전사원 당일 근태내역
		return session.selectList(namespace + ".att_alldlist", vo);
	}
	
	@Override
	public List<AttendanceVO> att_mlist(AttendanceSearchVO vo) throws Exception { //전사원 월 근태내역
		return session.selectList(namespace + ".att_mlist", vo);
	}

	@Override
	public List<AttendanceSearchVO> att_workMM() throws Exception {
		return session.selectList(namespace + ".att_workmm");
	}

	

}
