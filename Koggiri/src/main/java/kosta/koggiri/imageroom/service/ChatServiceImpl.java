package kosta.koggiri.imageroom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kosta.koggiri.imageroom.domain.ChatingDTO;
import kosta.koggiri.imageroom.domain.ImageRoomHisVO;
import kosta.koggiri.imageroom.persistence.ChatDAO;

@Service
public class ChatServiceImpl implements ChatService{
	@Inject
	private ChatDAO dao;
	
	@Override
	public void imageRoomHisRegist(ImageRoomHisVO vo) {
		dao.imageRoomHisInsert(vo);
	}

	@Override
	public List<ImageRoomHisVO> imageRoomHisList(Integer room_id) {
		return dao.imageRoomHisList(room_id);
	}

	@Override
	public Integer nextImageRoomHisNoRead() {
		return dao.nextImageRoomHisNoSelect();
	}

	@Override
	public List<ChatingDTO> chaingList(Integer room_id) {
		return dao.chaingList(room_id);
	}

	@Override
	public void imageRoomHisDelete(Integer room_id) {
		// TODO Auto-generated method stub
		dao.imageRoomHisDelete(room_id);
	}
	
}
