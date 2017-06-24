package kosta.koggiri.importantboard.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.importantboard.domain.Imp_BoardVO;
import kosta.koggiri.importantboard.domain.Imp_Criteria;
import kosta.koggiri.importantboard.domain.Imp_SearchCriteria;


@Repository
public class Imp_BoardDAOImpl implements Imp_BoardDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "koggiri.important.mappers.Imp_BoardMapper";

	@Override
	public void create(Imp_BoardVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}
	
	@Override
	public Imp_BoardVO read(Integer i_ID) throws Exception {
		System.out.println(i_ID);
		return session.selectOne(namespace+".read", i_ID);
	}

	@Override
	public void update(Imp_BoardVO vo) throws Exception {
		System.out.println(vo);
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer i_ID) throws Exception {
		session.delete(namespace + ".delete", i_ID);
	}

	@Override
	public List<Imp_BoardVO> listAll() throws Exception {
		System.out.println("2");
		
		return session.selectList(namespace + ".listAll");
	}
	
	@Override
	public List<Imp_BoardVO> listPage(int page) throws Exception {
		
		if(page<=0){
			page = 1;
		}
		
		page = (page-1)*10;
		
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<Imp_BoardVO> listCriteria(Imp_Criteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Imp_Criteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}
	
	@Override
	public List<Imp_BoardVO> listSearch(Imp_SearchCriteria cri) throws Exception {

		return session.selectList(namespace + ".listSearch", cri,
				new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int listSearchCount(Imp_SearchCriteria cri) throws Exception {

		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
	@Override
	public void addAttach(String fullName) throws Exception {
		
		session.insert(namespace + ".addAttach", fullName);
		
	}
	
	@Override
	public List<String> getAttach(Integer i_ID) throws Exception {
		return session.selectList(namespace + ".getAttach", i_ID);
	}

	@Override
	public void deleteAttach(Integer i_ID) throws Exception {
		session.insert(namespace + ".deleteAttach", i_ID);
		
	}

	@Override
	public void replaceAttach(String fullName, Integer i_ID) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("fullName", fullName);
		paramMap.put("I_ID", i_ID);
		
		
		System.out.println(i_ID);
		System.out.println(fullName);
		session.insert(namespace + ".replaceAttach", paramMap);
		
	}

	@Override
	public void updateViewCnt(Integer i_ID) throws Exception {
		session.update(namespace + ".updateViewCnt", i_ID);
	}

	@Override
	public List<Imp_BoardVO> SearchId(Imp_BoardVO vo) throws Exception {
		return session.selectList(namespace + ".SearchId", vo);
	}

	@Override
	public int SearchId_count(Imp_BoardVO vo) throws Exception {
		return session.selectOne(namespace + ".SearchId_count", vo);
	}

	


}
