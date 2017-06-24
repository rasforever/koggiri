package kosta.koggiri.document.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.domain.Doc_Criteria;
import kosta.koggiri.document.domain.Doc_SearchCriteria;

@Repository
public class Doc_BoardDAOImpl implements Doc_BoardDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "kosta.koggiri.mapper.Doc_BoardMapper";

	@Override
	public void create(Doc_BoardVO vo) throws Exception {
		session.insert(namespace + ".create", vo);

	}

	@Override
	public Doc_BoardVO read(Integer f_id) throws Exception {

		return session.selectOne(namespace + ".read", f_id);
	}

	@Override
	public void update(Doc_BoardVO vo) throws Exception {

		session.update(namespace + ".update", vo);

	}

	@Override
	public void delete(Integer f_id) throws Exception {

		session.delete(namespace + ".delete", f_id);

	}

	@Override
	public List<Doc_BoardVO> listSearch(Doc_SearchCriteria cri) throws Exception {

		return session.selectList(namespace + ".listSearch", cri,
				new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int listSearchCount(Doc_SearchCriteria cri) throws Exception {

		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void updateViewCnt(Integer f_id) throws Exception {

		session.update(namespace + ".updateViewCnt", f_id);
	}

	@Override
	public void addAttach(String fullName) throws Exception {
		
		session.insert(namespace + ".addAttach", fullName);
		
	}

	@Override
	public List<String> getAttach(Integer f_id) throws Exception {
		
		return session.selectList(namespace + ".getAttach", f_id);
	}

	@Override
	public void deleteAttach(Integer f_id) throws Exception {
	
		session.delete(namespace + ".deleteAttach", f_id);
		
	}

	@Override
	public void replaceAttach(String fullName, Integer f_id) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("f_id", f_id);
		paramMap.put("fullName", fullName);
		
		session.insert(namespace + ".replaceAttach", paramMap);
		
	}

	@Override
	public List<Doc_BoardVO> SearchId(Doc_BoardVO vo) throws Exception {
		
		return session.selectList(namespace + ".SearchId", vo);
	}

	@Override
	public int SearchId_count(Doc_BoardVO vo) throws Exception {
	
		return session.selectOne(namespace + ".SearchId_count", vo);
	}
	
	
	
	
	
	
	
	

}
