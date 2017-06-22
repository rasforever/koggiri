package kosta.koggiri.attendance.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.attendance.domain.AttendanceVO;
import kosta.koggiri.jobis.domain.Jobis_EmpVO;
import kosta.koggiri.attendance.domain.Att_EmpVO;
import kosta.koggiri.attendance.domain.Att_Emp_InfoVO;
import kosta.koggiri.attendance.domain.Att_Vat_DtVO;
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
	public List<AttendanceVO> att_dlist(AttendanceVO vo) throws Exception { //���� �� ���³���
		return session.selectList(namespace + ".att_dlist", vo);
	}
	
	@Override
	public List<AttendanceVO> att_alldlist(AttendanceSearchVO vo) throws Exception { //����� ���� ���³���
		return session.selectList(namespace + ".att_alldlist", vo);
	}
	
	@Override
	public List<AttendanceVO> att_mlist(AttendanceSearchVO vo) throws Exception { //����� �� ���³���
		return session.selectList(namespace + ".att_mlist", vo);
	}

	@Override
	public List<AttendanceSearchVO> att_workMM() throws Exception {
		return session.selectList(namespace + ".att_workmm");
	}

	@Override
	public List<Att_EmpVO> att_selectList() throws Exception {
		return session.selectList(namespace + ".att_selectList");
	}

	@Override
	public void emp_vatcation(Att_Vat_DtVO vo) throws Exception {
		session.insert(namespace + ".emp_vatcation",vo);
	}

<<<<<<< HEAD
	//고병휘 jobis 추가
	@Override
	public List<AttendanceVO> jobis_search(String input_text) throws Exception {
		return session.selectList(namespace + ".jobis_search", input_text);
	}

	@Override
	public int emp_vat_ct(Att_Vat_DtVO vo) throws Exception {	
		return session.selectOne(namespace + ".emp_vat_ct", vo);
	}
	
=======
>>>>>>> branch 'master' of https://github.com/rasforever/koggiri

	

}
