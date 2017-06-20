package kosta.koggiri.admin_emp.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.admin_emp.domain.Admin_MemberVO;
import kosta.koggiri.admin_emp.domain.App_SearchVO;
import kosta.koggiri.admin_emp.domain.Dept_TypeVO;
import kosta.koggiri.admin_emp.domain.EmpInfo_AdminVO;
import kosta.koggiri.admin_emp.domain.EmpTimeVO;
import kosta.koggiri.admin_emp.domain.EmpVO;
import kosta.koggiri.admin_emp.domain.H_CalendarVO;
import kosta.koggiri.admin_emp.domain.H_ImportantVO;
import kosta.koggiri.admin_emp.domain.H_NoticeVO;
import kosta.koggiri.admin_emp.domain.Per_AppVO;
import kosta.koggiri.admin_emp.domain.Pos_TypeVO;
import kosta.koggiri.admin_emp.domain.Res_AppVO;
import kosta.koggiri.admin_emp.domain.Res_TypeVO;
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
	
	@Override
	public List<H_NoticeVO> list_notice() throws Exception {
		return session.selectList(namespace+".list_notice");
	}

	@Override
	public List<H_ImportantVO> list_important() throws Exception {
		return session.selectList(namespace+".list_important");
	}
	
	@Override
	public List<H_CalendarVO> list_calendar(String emp_id) throws Exception {
		return session.selectList(namespace+".list_calendar",emp_id);
	}

	@Override
	public List<Res_TypeVO> res_info() throws Exception {
		return session.selectList(namespace+".resign_type");
	}
	
	@Override
	public void update_Personnel(EmpInfo_AdminVO vo) throws Exception {
		session.update(namespace+".update_Personnel", vo);
	}
	


	@Override
	public void update_modifyInformation_addr(EmpInfo_AdminVO vo) throws Exception {
		session.update(namespace+".update_modifyInformation_addr", vo);
		
	}

	@Override
	public void update_modifyInformation_tel(EmpInfo_AdminVO vo) throws Exception {
		session.update(namespace+".update_modifyInformation_tel", vo);
		
	}

	@Override
	public void update_modifyInformation_email(EmpInfo_AdminVO vo) throws Exception {
		session.update(namespace+".update_modifyInformation_email", vo);
		
	}
	
	@Override
	public void update_resign(EmpInfo_AdminVO vo) throws Exception {
		session.update(namespace+".update_resign", vo);
	}

	@Override
	public List<Dept_TypeVO> dept_info() throws Exception {
		return session.selectList(namespace+".dept_info");
	}

	@Override
	public List<Pos_TypeVO> pos_info() throws Exception {
		return session.selectList(namespace+".pos_info");
	}

	@Override
	public void insert_resign(EmpInfo_AdminVO vo) throws Exception {
		session.insert(namespace+".insert_resign", vo);		
	}

	//인사발령리스트
	
	@Override
	public List<Per_AppVO> select_per(App_SearchVO search) throws Exception {
		return session.selectList(namespace+".select_per", search);
	}
	
	//퇴사리스트

	@Override
	public List<Res_AppVO> select_res(App_SearchVO search) throws Exception {
		return session.selectList(namespace+".select_res", search);
	}

	@Override
	public int msg_new_count(String emp_id) throws Exception {
		return session.selectOne(namespace+".msg_new_count", emp_id);
	}

	@Override
	public EmpTimeVO et_time(String emp_id) throws Exception {
		return session.selectOne(namespace+".selectW_L" ,emp_id);
	}

	

}
