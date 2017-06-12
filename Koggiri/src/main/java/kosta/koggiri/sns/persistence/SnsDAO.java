package kosta.koggiri.sns.persistence;

import java.util.List;

import kosta.koggiri.sns.domain.RoomVO;
import kosta.koggiri.sns.domain.SnsVO;

public interface SnsDAO {
	
	public List<SnsVO> listAll(String emp_id) throws Exception; 
	
	public RoomVO chat_room(String emp_id) throws Exception;

}
