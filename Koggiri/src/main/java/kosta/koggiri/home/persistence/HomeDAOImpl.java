package kosta.koggiri.home.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.domain.Doc_Criteria;
import kosta.koggiri.document.domain.Doc_SearchCriteria;
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
	public List<H_calendarVO> list_calendar() throws Exception {
		return session.selectList(namespace+".list_calendar");
	}

	
	

}
