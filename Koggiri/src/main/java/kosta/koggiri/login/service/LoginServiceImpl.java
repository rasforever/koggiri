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
		// TODO Auto-generated method stub
		return dao.get_emp_nm(vo);
	}

}
