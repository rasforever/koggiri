package kosta.koggiri.msg.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kosta.koggiri.msg.domain.Msg_EmpVO;
import kosta.koggiri.msg.domain.MsgVO;
import kosta.koggiri.msg.persistence.MsgDAO;

@Repository
public class MsgServiceImpl implements MsgService {

	@Inject
	private MsgDAO dao;

	@Override
	public List<Msg_EmpVO> msg_emplist(String emp_id) throws Exception {
		return dao.msg_emplist(emp_id);		
	}

	@Override
	public int msg_count(MsgVO vo) throws Exception {
		return dao.msg_count(vo);
	}
	
	@Transactional
	@Override
	public List<MsgVO> create_msg(MsgVO vo) throws Exception {
		dao.create_msg(vo);
		vo.setMsg_id(dao.chat_msg_id(vo));
		return  dao.msgcontent(vo);		
	}
	
	@Transactional
	@Override
	public List<MsgVO> msgcontent(MsgVO vo) throws Exception {
		vo.setMsg_id(dao.chat_msg_id(vo));
		dao.update_msg_confirm(vo);
		return dao.msgcontent(vo);
	}

	@Override //고병휘 추가
	public void create_msg_context(MsgVO vo) throws Exception {		
		dao.create_msg_context(vo);
		
	}
	
}
