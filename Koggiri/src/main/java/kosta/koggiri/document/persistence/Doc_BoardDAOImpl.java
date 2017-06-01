package kosta.koggiri.document.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.document.domain.Doc_BoardVO;

@Repository
public class Doc_BoardDAOImpl implements Doc_BoardDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "kosta.koggiri.mapper.Doc_BoardMapper";

	@Override
	public void create(Doc_BoardVO vo) throws Exception {
		session.insert(namespace + ".create", vo);

	}

	@Override
	public Doc_BoardVO read(Integer f_id) throws Exception {

		return session.selectOne(namespace + ".read", f_id);
	}

	@Override
	public void update(Doc_BoardVO vo) throws Exception {

		session.update(namespace + ".update", vo);

	}

	@Override
	public void delete(Integer f_id) throws Exception {

		session.delete(namespace + ".delete", f_id);

	}

	@Override
	public List<Doc_BoardVO> listAll() throws Exception {

		return session.selectList(namespace + ".listAll");
	}

}