package kosta.koggiri.msg.service;

import java.util.List;

import kosta.koggiri.msg.domain.Msg_EmpVO;
import kosta.koggiri.msg.domain.MsgVO;
 
public interface MsgService {
	
	public List<Msg_EmpVO>listAll(String emp_id) throws Exception; //대화 상대 목록 출력
	
	public int chat_room_count(MsgVO vo) throws Exception; //대화방 체크 카운터
	
	public void create_room(MsgVO vo)throws Exception; //대화방 생성
	
	public List<MsgVO> chat(MsgVO vo)throws Exception; //대화목록 가져오기
	
	public MsgVO create_chat_context(MsgVO vo)throws Exception; //대화저장하기 고병휘추가

}
