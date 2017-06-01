package kosta.koggiri.approval.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.approval.domain.ApprovalVO;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO{
	
	@Inject
	private SqlSession session;

	private static String namespace = "kosta.koggiri.mapper.ApprovalMapper";

	@Override
	public void create(ApprovalVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
		
	}

	@Override
	public ApprovalVO read(String app_id) throws Exception {
		return session.selectOne(namespace + ".read", app_id);
	}

	@Override
	public void update(ApprovalVO vo) throws Exception {
		session.update(namespace + ".update", vo);
		
	}

	@Override
	public void delete(String app_id) throws Exception {
		session.delete(namespace + ".delete", app_id);
		
	}

	@Override
	public List<ApprovalVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

}
