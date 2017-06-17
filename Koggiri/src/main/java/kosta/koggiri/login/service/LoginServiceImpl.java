package kosta.koggiri.login.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kosta.koggiri.login.domain.MemberVO;
import kosta.koggiri.login.dto.LoginDTO;
import kosta.koggiri.login.persistence.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Inject
	private LoginDAO dao;
	
	@Override
	public MemberVO logincheck(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public String getEmpnmbyMemid(MemberVO vo) throws Exception {
		return dao.get_emp_nm(vo);
	}

	@Override
	public void mem_update(MemberVO vo) throws Exception {
		dao.mem_update(vo);
		
	}

	@Override
	public MemberVO detail_mem(String mem_id) throws Exception {
		return dao.detail_mem(mem_id);
	}

	@Override
	public void mem_pass(MemberVO vo) throws Exception {
		dao.mem_pass(vo);
		
	}
	
	
}
