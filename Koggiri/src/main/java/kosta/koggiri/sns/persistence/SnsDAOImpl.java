package kosta.koggiri.sns.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.sns.domain.RoomVO;
import kosta.koggiri.sns.domain.SnsVO;

@Repository
public class SnsDAOImpl implements SnsDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "kosta.koggiri.mapper.SnsMapper";

	@Override
	public List<SnsVO> listAll(String emp_id) throws Exception {
		System.out.println(emp_id);
		System.out.println("dao까지왓음");
		return session.selectList(namespace + ".listAll", emp_id);

	}

	@Override
	public int chat_room_count(RoomVO vo) throws Exception {
		return session.selectOne(namespace + ".chat_room_count", vo);
	}

	@Override
	public void create_room(RoomVO vo) throws Exception {
		System.out.println(vo.getEmp_id());
		System.out.println(vo.getN_emp_id());
		session.insert(namespace + ".create_room", vo);

	}

	@Override
	public List<RoomVO> chat(RoomVO vo) throws Exception {
		return session.selectList(namespace + ".chat", vo);
	}

	@Override
	public int chat_room_id(RoomVO vo) throws Exception {
		return session.selectOne(namespace + ".chat_room_id", vo);
	}

	@Override // 고병휘 추가
	public RoomVO create_chat_context(RoomVO vo) throws Exception {

		return session.selectOne(namespace + ".create_chat_context", vo);
	}

}
