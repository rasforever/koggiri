package kosta.koggiri.login.persistence;

import kosta.koggiri.login.domain.MemberVO;
import kosta.koggiri.login.dto.LoginDTO;

public interface LoginDAO {
	
	public MemberVO login(LoginDTO dto)throws Exception;
	
	public String get_emp_nm(MemberVO vo)throws Exception;
	
	public void mem_e_mail_update(MemberVO vo) throws Exception;
	public void mem_tel_no_update(MemberVO vo) throws Exception;
	public void mem_addr_update(MemberVO vo) throws Exception;
	
	
	public void mem_file_update(MemberVO vo)throws Exception;
	
	public MemberVO detail_mem(String mem_id)throws Exception;
	
	public void mem_pass(MemberVO vo)throws Exception;
	
}
