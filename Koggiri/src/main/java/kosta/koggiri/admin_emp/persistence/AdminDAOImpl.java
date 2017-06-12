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
		return session.selectList(namespace+".selectList", search);
	}

	@Override
	public void insertEmp(EmpVO vo) throws Exception {
		session.insert(namespace+".insertEmp", vo);
	}

	@Override
	public String findEmpid(EmpVO vo) throws Exception {
		return session.selectOne(namespace+".findEmpid", vo);
	}

	@Override
	public void tempPass(EmpVO vo) throws Exception {
		session.insert(namespace+".tempPass", vo);
	}

	@Override
	public void tempPassUpdate(Admin_MemberVO advo) throws Exception {
		session.update(namespace+".tempPassUpdate", advo);
	}

	@Override
	public EmpVO mainEmp(EmpVO vo) throws Exception {
		return session.selectOne(namespace+".mainEmp", vo);
	}

	
	@Override
	public void updateLev(String emp_id) throws Exception {
		session.update(namespace+".updateLev", emp_id);
		
	}

	@Override
	public void updateAtt(String emp_id) throws Exception {
		session.update(namespace+".updateAtt", emp_id);
		
	}

	@Override
	public List<EmpVO> searchEmp(EmpVO vo) throws Exception {
		return session.selectList(namespace+".searchEmp", vo);
	}
	
	@Override
	public List<EmpVO> searchatt_Emp(EmpVO vo) throws Exception {
		return session.selectList(namespace+".searchatt_Emp", vo);
	}

}
