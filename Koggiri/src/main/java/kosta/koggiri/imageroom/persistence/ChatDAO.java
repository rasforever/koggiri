package kosta.koggiri.imageroom.persistence;

import java.util.List;

import kosta.koggiri.imageroom.domain.ChatingDTO;
import kosta.koggiri.imageroom.domain.ImageRoomHisVO;


public interface ChatDAO {
	public void imageRoomHisInsert(ImageRoomHisVO vo);
	public List<ImageRoomHisVO> imageRoomHisList(Integer room_id);
	public Integer nextImageRoomHisNoSelect();
	public List<ChatingDTO> chaingList(Integer room_id);
}
