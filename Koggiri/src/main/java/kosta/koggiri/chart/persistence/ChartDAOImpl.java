package kosta.koggiri.chart.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.chart.domain.ChartVO;


@Repository
public class ChartDAOImpl implements ChartDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "kosta.koggiri.mapper.ChartMapper";

	@Override
	public List<ChartVO> MM() throws Exception {
		return session.selectList(namespace + ".MM");
	}

	@Override
	public ChartVO read(String emp_id) throws Exception {

		return session.selectOne(namespace + ".read", emp_id);
	}
}
