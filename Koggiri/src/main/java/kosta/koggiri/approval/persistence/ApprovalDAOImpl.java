package kosta.koggiri.approval.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.approval.domain.AppTypeVO;
import kosta.koggiri.approval.domain.ApprovalSearchVO;
import kosta.koggiri.approval.domain.ApprovalVO;
import kosta.koggiri.approval.domain.DeptVO;
import kosta.koggiri.approval.domain.Emp_InfoVO;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "kosta.koggiri.mapper.ApprovalMapper";

	@Override
	public void create(ApprovalVO vo) throws Exception {
		session.insert(namespace + ".create", vo);

	}

	@Override
	public ApprovalVO read(String app_id) throws Exception {
		return session.selectOne(namespace + ".read", app_id);
	}

	@Override
	public void update(ApprovalVO vo) throws Exception {
		session.update(namespace + ".update", vo);

	}

	@Override
	public void delete(String app_id) throws Exception {
		session.delete(namespace + ".delete", app_id);

	}

	@Override
	public List<AppTypeVO> appty_select() throws Exception {
		return session.selectList(namespace + ".appty_select");
	}

	@Override
	public List<DeptVO> dept_select() throws Exception {
		return session.selectList(namespace + ".dept_select");
	}

	@Override
	public Emp_InfoVO einfo_select(String emp_id) throws Exception {
		return session.selectOne(namespace + ".einfo_select", emp_id);
	}

	@Override
	public List<ApprovalVO> listSearch(ApprovalSearchVO search) throws Exception {	
		if(search.getSearchType().equals("s")){
			return session.selectList(namespace + ".listsSearch", search,
					new RowBounds(search.getPageStart(), search.getPerPageNum()));			
		}else if (search.getSearchType().equals("r")){
			return session.selectList(namespace + ".listrSearch", search,
					new RowBounds(search.getPageStart(), search.getPerPageNum()));			
		}else {
			return session.selectList(namespace + ".listsSearch", search,
					new RowBounds(search.getPageStart(), search.getPerPageNum()));	
		}
	}

	@Override
	public int listSearchCount(ApprovalSearchVO search) throws Exception {
		if(search.getSearchType().equals("s")){
			return session.selectOne(namespace + ".listsSearchCount", search);
		}else if (search.getSearchType().equals("r")){
			return session.selectOne(namespace + ".listrSearchCount", search);
		}else {
			return session.selectOne(namespace + ".listsSearchCount", search);
		}
	}

	@Override
	public void addAttach(String fullName, String app_id) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("app_id", app_id);
		paramMap.put("fullName", fullName);
		
		session.insert(namespace + ".addAttach", paramMap);

	}

	@Override
	public List<String> getAttach(String app_id) throws Exception {
		return session.selectList(namespace + ".getAttach", app_id);
	}

	@Override
	public void deleteAttach(String app_id) throws Exception {
		session.delete(namespace + ".deleteAttach", app_id);

	}

	@Override
	public void replaceAttach(String fullName, String app_id) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("app_id", app_id);
		paramMap.put("fullName", fullName);

		session.insert(namespace + ".replaceAttach", paramMap);

	}

	@Override
	public void updateAPP(ApprovalVO vo) throws Exception {
		session.update(namespace + ".updateAPP", vo);		
	}
}
