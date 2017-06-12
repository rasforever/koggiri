package kosta.koggiri.home.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.home.domain.H_NoticeVO;
import kosta.koggiri.home.domain.H_calendarVO;
import kosta.koggiri.home.domain.H_importantVO;

@Repository
public class HomeDAOImpl implements HomeDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "kosta.koggiri.mapper.HomeMapper";

	@Override
	public List<H_NoticeVO> list_notice() throws Exception {
		return session.selectList(namespace+".list_notice");
	}

	@Override
	public List<H_importantVO> list_important() throws Exception {
		return session.selectList(namespace+".list_important");
	}
	
	@Override
	public List<H_calendarVO> list_calendar(String emp_id) throws Exception {
		return session.selectList(namespace+".list_calendar",emp_id);
	}

	
	

}
