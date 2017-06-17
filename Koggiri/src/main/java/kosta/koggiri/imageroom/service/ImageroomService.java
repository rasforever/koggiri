package kosta.koggiri.imageroom.service;

import java.util.List;

import kosta.koggiri.imageroom.domain.ImageroomDTO;
import kosta.koggiri.imageroom.domain.ImageroomVO;

public interface ImageroomService {
	
	public List<ImageroomDTO> imageRoomList();
	public void imageRoomRegist(ImageroomVO imageRoom);
	public Integer nextRoomNoRead();
	public ImageroomDTO empRead(String emp_id);
	public void imageRoomRemove(Integer room_id);

}
