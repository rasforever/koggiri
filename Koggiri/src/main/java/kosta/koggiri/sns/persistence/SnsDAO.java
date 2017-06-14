package kosta.koggiri.sns.persistence;

import java.util.List;

import kosta.koggiri.sns.domain.RoomVO;
import kosta.koggiri.sns.domain.SnsVO;

public interface SnsDAO {
	
	public List<SnsVO> listAll(String emp_id) throws Exception; 
	
	public int chat_room_count(RoomVO vo) throws Exception;	

	public int chat_room_id(RoomVO vo) throws Exception; 
	
	public void create_room(RoomVO vo)throws Exception;
	
	public List<RoomVO> chat(RoomVO vo)throws Exception;
	
	public RoomVO create_chat_context(RoomVO vo)throws Exception; //고병휘 추가

}
