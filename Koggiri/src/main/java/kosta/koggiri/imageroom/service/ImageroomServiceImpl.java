package kosta.koggiri.imageroom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.koggiri.imageroom.domain.ImageroomDTO;
import kosta.koggiri.imageroom.domain.ImageroomVO;
import kosta.koggiri.imageroom.persistence.ImageroomDAO;

@Service
public class ImageroomServiceImpl implements ImageroomService {

	@Inject
	private ImageroomDAO dao;

	@Override
	public List<ImageroomDTO> imageRoomList() {
		// TODO Auto-generated method stub
		return dao.imageRoomList();
	}
	
	@Transactional
	@Override
	public void imageRoomRegist(ImageroomVO imageRoom) {
		Integer room_id = nextRoomNoRead();
		imageRoom.setRoom_id(room_id);
		
		dao.imageRoomInsert(imageRoom);
		
	}

	@Override
	public Integer nextRoomNoRead() {
		Integer room_id = dao.nextRoomNoSelect();
		
		if(room_id == null){
			room_id = 1;
		}
		
		return room_id;
	}

	@Override
	public ImageroomDTO empRead(String emp_id) {
		
		return dao.empSelect(emp_id);
	}

	@Override
	public void imageRoomRemove(Integer room_id) {
		// TODO Auto-generated method stub
		dao.imageRoomDelete(room_id);
	}
	

	
	

}
