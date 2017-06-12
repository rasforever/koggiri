package kosta.koggiri.sns.service;

import java.util.List;

import kosta.koggiri.sns.domain.RoomVO;
import kosta.koggiri.sns.domain.SnsVO;
 
public interface SnsService {
	
	public List<SnsVO>listAll(String emp_id) throws Exception; //대화 상대 목록 출력
	
	public int chat_room_count(RoomVO vo) throws Exception; //대화방 체크 카운터
	
	public void create_room(RoomVO vo)throws Exception; //대화방 생성
	
	public List<RoomVO> chat(RoomVO vo)throws Exception; //대화목록 가져오기

}
