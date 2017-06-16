package kosta.koggiri.imageroom.persistence;

import java.util.List;

import kosta.koggiri.imageroom.domain.ImageroomDTO;
import kosta.koggiri.imageroom.domain.ImageroomVO;

public interface ImageroomDAO {
		
	public List<ImageroomDTO> imageRoomList();
	public void imageRoomInsert(ImageroomVO imageRoom);
	public Integer nextRoomNoSelect();
	public ImageroomDTO empSelect(String emp_id);
	public void imageRoomDelete(Integer room_id);
}
