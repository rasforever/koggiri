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

}
