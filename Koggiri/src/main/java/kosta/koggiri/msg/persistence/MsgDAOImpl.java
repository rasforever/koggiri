package kosta.koggiri.msg.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.msg.domain.Msg_EmpVO;
import kosta.koggiri.msg.domain.MsgVO;

@Repository
public class MsgDAOImpl implements MsgDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "kosta.koggiri.mapper.MsgMapper";

	@Override
	public List<Msg_EmpVO> listAll(String emp_id) throws Exception {
		System.out.println(emp_id);
		System.out.println("dao까지왓음");
		return session.selectList(namespace + ".listAll", emp_id);

	}

	@Override
	public int chat_room_count(MsgVO vo) throws Exception {
		return session.selectOne(namespace + ".chat_room_count", vo);
	}

	@Override
	public void create_room(MsgVO vo) throws Exception {
		System.out.println(vo.getEmp_id());
		System.out.println(vo.getN_emp_id());
		session.insert(namespace + ".create_room", vo);

	}

	@Override
	public List<MsgVO> chat(MsgVO vo) throws Exception {
		return session.selectList(namespace + ".chat", vo);
	}

	@Override
	public int chat_room_id(MsgVO vo) throws Exception {
		return session.selectOne(namespace + ".chat_room_id", vo);
	}

	@Override // 고병휘 추가
	public MsgVO create_chat_context(MsgVO vo) throws Exception {

		return session.selectOne(namespace + ".create_chat_context", vo);
	}

}
