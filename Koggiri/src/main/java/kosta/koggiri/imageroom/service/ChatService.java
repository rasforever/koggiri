package kosta.koggiri.imageroom.service;

import java.util.List;

import kosta.koggiri.imageroom.domain.ChatingDTO;
import kosta.koggiri.imageroom.domain.ImageRoomHisVO;

public interface ChatService {
	public void imageRoomHisRegist(ImageRoomHisVO vo);
	public List<ImageRoomHisVO> imageRoomHisList(Integer room_id);
	public Integer nextImageRoomHisNoRead();
	public List<ChatingDTO> chaingList(Integer room_id);
}
