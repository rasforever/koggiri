package kosta.koggiri.approval.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.approval.domain.AppTypeVO;
import kosta.koggiri.approval.domain.ApprovalVO;
import kosta.koggiri.approval.domain.DeptVO;
import kosta.koggiri.approval.domain.Emp_InfoVO;
import kosta.koggiri.approval.domain.SearchCriteria;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "kosta.koggiri.mapper.ApprovalMapper";

	@Override
	public void create(ApprovalVO vo) throws Exception {
		System.out.println(vo.getApp_type_cd());
		System.out.println(vo.getDraft_emp_id());
		System.out.println(vo.getApp_emp_id());
		System.out.println(vo.getDraft_dt());
		System.out.println(vo.getApp_title());
		System.out.println(vo.getApp_context());
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
	public List<ApprovalVO> listAll() throws Exception {
		return session.selectList(namespace + ".listAll");
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
	public List<ApprovalVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri,
				new RowBounds(cri.getPageStart(), cri.getPerPageNum()));
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
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

}
