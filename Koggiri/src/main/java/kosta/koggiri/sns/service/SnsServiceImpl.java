package kosta.koggiri.sns.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kosta.koggiri.sns.domain.RoomVO;
import kosta.koggiri.sns.domain.SnsVO;
import kosta.koggiri.sns.persistence.SnsDAO;

@Repository
public class SnsServiceImpl implements SnsService {

	@Inject
	private SnsDAO dao;

	@Override
	public List<SnsVO> listAll(String emp_id) throws Exception {
		System.out.println("service까지왓음");
		System.out.println("service"+ emp_id);
		return dao.listAll(emp_id);
		
	}

	@Override
	public int chat_room_count(RoomVO vo) throws Exception {
		return dao.chat_room_count(vo);
	}

	@Override
	public void create_room(RoomVO vo) throws Exception {
		dao.create_room(vo);
		
	}
	
	@Transactional
	@Override
	public List<RoomVO> chat(RoomVO vo) throws Exception {
		vo.setRoom_id(dao.chat_room_id(vo));
		return dao.chat(vo);
	}







}
