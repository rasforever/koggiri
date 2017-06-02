package kosta.koggiri.login.persistence;

import kosta.koggiri.login.domain.MemberVO;
import kosta.koggiri.login.dto.LoginDTO;

public interface LoginDAO {
	
	public MemberVO login(LoginDTO dto)throws Exception;
	
	public String get_emp_nm(MemberVO vo)throws Exception;
}
