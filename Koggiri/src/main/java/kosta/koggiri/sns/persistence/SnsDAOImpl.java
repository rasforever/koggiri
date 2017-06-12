package kosta.koggiri.sns.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.sns.domain.SnsVO;

@Repository
public class SnsDAOImpl implements SnsDAO {

 @Inject
 private SqlSession session;
 
 private static String namespace
 ="kosta.koggiri.mapper.SnsMapper";

@Override
public List<SnsVO> listAll(String emp_id) throws Exception {
	System.out.println(emp_id);
	System.out.println("dao까지왓음");
	return session.selectList(namespace+".listAll", emp_id);
	
}
}
