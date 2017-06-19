package kosta.koggiri.login.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.login.domain.MemberVO;
import kosta.koggiri.login.dto.LoginDTO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace ="koggiri.login.mapper.MemberMapper";
	
	@Override
	public MemberVO login(LoginDTO dto)throws Exception {
		return session.selectOne(namespace+".login", dto);
	}

	@Override
	public String get_emp_nm(MemberVO vo)throws Exception {
		return session.selectOne(namespace+".get_emp_nm", vo);
	}

	@Override
	public void mem_update(MemberVO vo) throws Exception {
		session.update(namespace+".mem_update", vo);
		
	}

	@Override
	public MemberVO detail_mem(String mem_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".detail_mem", mem_id);
	}

	@Override
	public void mem_pass(MemberVO vo) throws Exception {
		session.update(namespace+".mem_pass", vo);
	}
	
	
}
