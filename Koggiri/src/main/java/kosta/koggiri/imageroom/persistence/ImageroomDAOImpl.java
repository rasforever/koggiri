package kosta.koggiri.imageroom.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.imageroom.domain.ImageroomVO;

@Repository
public class ImageroomDAOImpl implements ImageroomDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "kosta.koggiri.mapper.ImageroomMapper";

	@Override
	public List<ImageroomVO> list(String emp_id) throws Exception {
		return session.selectList(namespace + ".list", emp_id);
	}


}
