package kosta.koggiri.sns.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

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
	public RoomVO chat_room(String emp_id) throws Exception {
		return dao.chat_room(emp_id);
	}



}
