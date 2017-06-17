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
	public List<Msg_EmpVO> msg_emplist(String emp_id) throws Exception {
		return session.selectList(namespace + ".msg_emplist", emp_id);

	}

	@Override
	public int msg_count(MsgVO vo) throws Exception {
		return session.selectOne(namespace + ".msg_count", vo);
	}

	@Override
	public void create_msg(MsgVO vo) throws Exception {
		session.insert(namespace + ".create_msg", vo);

	}

	@Override
	public List<MsgVO> msgcontent(MsgVO vo) throws Exception {
		return session.selectList(namespace + ".msgcontent", vo);
	}

	@Override
	public int chat_msg_id(MsgVO vo) throws Exception {
		return session.selectOne(namespace + ".chat_msg_id", vo);
	}

	@Override // 고병휘 추가
	public void create_msg_context(MsgVO vo) throws Exception {
		session.insert(namespace + ".create_msg_context", vo);
	}

}
