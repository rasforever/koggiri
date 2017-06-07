package kosta.koggiri.admin_emp.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.admin_emp.domain.Admin_MemberVO;
import kosta.koggiri.admin_emp.domain.EmpVO;
import kosta.koggiri.admin_emp.domain.SearchVO;
import kosta.koggiri.admin_emp.domain.SearchedEmpVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace ="kosta.koggiri.mapper.AdminMapper";
	
	@Override
	public List<SearchedEmpVO> selectList(SearchVO search) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".selectList", search);
	}

	@Override
	public void insertEmp(EmpVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insertEmp", vo);
	}

	@Override
	public String findEmpid(EmpVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".findEmpid", vo);
	}

	@Override
	public void tempPass(EmpVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".tempPass", vo);
	}

	@Override
	public void tempPassUpdate(Admin_MemberVO advo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".tempPassUpdate", advo);
	}

}
