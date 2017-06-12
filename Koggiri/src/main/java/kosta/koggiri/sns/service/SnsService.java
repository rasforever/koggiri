package kosta.koggiri.sns.service;

import java.util.List;

import kosta.koggiri.sns.domain.RoomVO;
import kosta.koggiri.sns.domain.SnsVO;
 
public interface SnsService {
	
	public List<SnsVO>listAll(String emp_id) throws Exception;
	
	public RoomVO chat_room(String emp_id) throws Exception;

}
