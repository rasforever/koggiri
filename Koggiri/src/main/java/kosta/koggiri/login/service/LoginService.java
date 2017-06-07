package kosta.koggiri.login.service;

import kosta.koggiri.login.domain.MemberVO;
import kosta.koggiri.login.dto.LoginDTO;

public interface LoginService {
	
	public MemberVO logincheck(LoginDTO dto)throws Exception;
	
	public String getEmpnmbyMemid(MemberVO vo)throws Exception;
	
	public void mem_update(MemberVO vo)throws Exception;
	
	public MemberVO detail_mem(String mem_id )throws Exception;
	
	public void mem_pass(MemberVO vo)throws Exception;
	
	
}
