package kosta.koggiri.task.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import kosta.koggiri.task.domain.TaskSearchCriteria;
import kosta.koggiri.task.domain.TaskVO;
import kosta.koggiri.task.persistence.TaskDAO;

@Repository
public class TaskDAOImpl implements TaskDAO {

 @Inject
 private SqlSession session;
 
 private static String namespace
 ="kosta.koggiri.mapper.TaskMapper";

@Override
public void create(TaskVO vo) throws Exception {
	session.insert(namespace + ".create", vo);
	
}

@Override
public TaskVO read(Integer ta_seq) throws Exception {
	return session.selectOne(namespace + ".read", ta_seq);
}

@Override
public void update(TaskVO vo) throws Exception {
	session.update(namespace + ".update", vo);
	
}

@Override
public void delete(Integer ta_seq) throws Exception {
	session.delete(namespace + ".delete", ta_seq);
	
}

@Override
public List<TaskVO> listSearch(TaskSearchCriteria cri) throws Exception {
	return session.selectList(namespace + ".listSearch", cri,
			new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
}

@Override
public int listSearchCount(TaskSearchCriteria cri) throws Exception {
	return session.selectOne(namespace + ".listSearchCount", cri);
}

@Override
public void updateViewCnt(Integer ta_seq) throws Exception {
	session.update(namespace + ".updateViewCnt", ta_seq);
	
}


}
