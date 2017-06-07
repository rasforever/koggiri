package kosta.koggiri.login.persistence;

import kosta.koggiri.login.domain.MemberVO;
import kosta.koggiri.login.dto.LoginDTO;

public interface LoginDAO {
	
	public MemberVO login(LoginDTO dto)throws Exception;
	
	public String get_emp_nm(MemberVO vo)throws Exception;
	
	public void mem_update(MemberVO vo)throws Exception;
	
	public MemberVO detail_mem(String mem_id)throws Exception;
	
	public void mem_pass(MemberVO vo)throws Exception;
	
}
