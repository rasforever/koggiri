package kosta.koggiri.msg.persistence;

import java.util.List;

import kosta.koggiri.msg.domain.Msg_EmpVO;
import kosta.koggiri.msg.domain.MsgVO;


public interface MsgDAO {
	
	public List<Msg_EmpVO> listAll(String emp_id) throws Exception; 
	
	public int chat_room_count(MsgVO vo) throws Exception;	

	public int chat_room_id(MsgVO vo) throws Exception; 
	
	public void create_room(MsgVO vo)throws Exception;
	
	public List<MsgVO> chat(MsgVO vo)throws Exception;
	
	public MsgVO create_chat_context(MsgVO vo)throws Exception; //고병휘 추가

}
