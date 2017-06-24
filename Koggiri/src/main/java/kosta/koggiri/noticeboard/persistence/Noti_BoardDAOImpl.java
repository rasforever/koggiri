package kosta.koggiri.noticeboard.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.noticeboard.domain.Noti_BoardVO;
import kosta.koggiri.noticeboard.domain.Noti_Criteria;
import kosta.koggiri.noticeboard.domain.Noti_SearchCriteria;

@Repository
public class Noti_BoardDAOImpl implements Noti_BoardDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "koggiri.notice.mappers.Noti_BoardMapper";
	
	@Override
	public void create(Noti_BoardVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}
	
	@Override
	public Noti_BoardVO read(Integer n_ID) throws Exception {
		System.out.println(n_ID);
		return session.selectOne(namespace+".read", n_ID);
	}

	@Override
	public void update(Noti_BoardVO vo) throws Exception {
		System.out.println(vo);
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer n_ID) throws Exception {
		session.delete(namespace + ".delete", n_ID);
	}

	@Override
	public List<Noti_BoardVO> listAll() throws Exception {
		System.out.println("2");
		
		return session.selectList(namespace + ".listAll");
	}
	
	@Override
	public List<Noti_BoardVO> listPage(int page) throws Exception {
		
		if(page<=0){
			page = 1;
		}
		
		page = (page-1)*10;
		
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<Noti_BoardVO> listCriteria(Noti_Criteria cri) throws Exception {
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Noti_Criteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}
	
	@Override
	public List<Noti_BoardVO> listSearch(Noti_SearchCriteria cri) throws Exception {

		return session.selectList(namespace + ".listSearch", cri,
				new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int listSearchCount(Noti_SearchCriteria cri) throws Exception {

		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
	@Override
	public void addAttach(String fullName) throws Exception {
		
		session.insert(namespace + ".addAttach", fullName);
		
	}
	
	@Override
	public List<String> getAttach(Integer n_ID) throws Exception {
		return session.selectList(namespace + ".getAttach", n_ID);
	}

	@Override
	public void deleteAttach(Integer n_ID) throws Exception {
		session.insert(namespace + ".deleteAttach", n_ID);
		
	}

	@Override
	public void replaceAttach(String fullName, Integer n_ID) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("fullName", fullName);
		paramMap.put("N_ID", n_ID);
		
		
		System.out.println(n_ID);
		System.out.println(fullName);
		session.insert(namespace + ".replaceAttach", paramMap);
		
	}

	@Override
	public void updateViewCnt(Integer n_ID) throws Exception {
		session.update(namespace + ".updateViewCnt", n_ID);
	}

	@Override
	public List<Noti_BoardVO> SearchId(Noti_BoardVO vo) throws Exception {
	
		return session.selectList(namespace + ".SearchId" , vo);
	}

	@Override
	public int SearchId_count(Noti_BoardVO vo) throws Exception {
		
		return session.selectOne(namespace + ".SearchId_count" , vo);
	}

	

}
