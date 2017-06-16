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
	public List<Msg_EmpVO> listAll(String emp_id) throws Exception {
		System.out.println("service까지왓음");
		System.out.println("service"+ emp_id);
		return dao.listAll(emp_id);
		
	}

	@Override
	public int chat_room_count(MsgVO vo) throws Exception {
		return dao.chat_room_count(vo);
	}

	@Override
	public void create_room(MsgVO vo) throws Exception {
		dao.create_room(vo);
		
	}
	
	@Transactional
	@Override
	public List<MsgVO> chat(MsgVO vo) throws Exception {
		vo.setMsg_id(dao.chat_room_id(vo));
		return dao.chat(vo);
	}

	@Override //고병휘 추가
	public MsgVO create_chat_context(MsgVO vo) throws Exception {
		
		return dao.create_chat_context(vo);
		
	}
	
	







}
