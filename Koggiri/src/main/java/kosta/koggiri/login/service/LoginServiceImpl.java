package kosta.koggiri.login.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Transactional
	@Override
	public void mem_update(MemberVO vo) throws Exception {
		if (vo.getAddr() != null) {
			dao.mem_addr_update(vo);
		}
		if (vo.getTel_no() != null ) {
			if ( vo.getTel_no().equals("010--")){				
			}else{
				dao.mem_tel_no_update(vo);
			}
		}
		if (vo.getE_mail() != null ) {
			if ( vo.getE_mail().equals("@naver.com")){				
			}else{
				dao.mem_e_mail_update(vo);
			}
		}
		if (vo.getFilename() != null) {
			dao.mem_file_update(vo);
		}
		
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
