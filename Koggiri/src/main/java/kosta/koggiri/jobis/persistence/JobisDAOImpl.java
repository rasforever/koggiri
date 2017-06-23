package kosta.koggiri.jobis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.jobis.domain.Jobis_EmpVO;

@Repository
public class JobisDAOImpl implements JobisDAO{
	
	@Inject
	private SqlSession session;

	private static String namespace = "kosta.koggiri.mapper.JobisMapper";

	@Override
	public List<Jobis_EmpVO> all_emplist() throws Exception {
		return session.selectList(namespace + ".all_emplist");
	}

	//고병휘 jobis 추가
	@Override
	public List<Jobis_EmpVO> all_attendlist() throws Exception {
		
		return session.selectList(namespace + ".all_attendlist");
	}

	@Override
	public List<Jobis_EmpVO> all_approvalcheck() throws Exception {
		
		return session.selectList(namespace + ".all_approvalcheck");
	}

	@Override
	public List<Jobis_EmpVO> every_emp() throws Exception {
		
		return session.selectList(namespace + ".every_emp");
	}
	


	
	
	
	
	
	
	

}
