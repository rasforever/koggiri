package kosta.koggiri.msg.persistence;

import java.util.List;

import kosta.koggiri.msg.domain.Msg_EmpVO;
import kosta.koggiri.msg.domain.MsgVO;


public interface MsgDAO {
	
	public List<Msg_EmpVO> msg_emplist(String emp_id) throws Exception; 
	
	public int msg_count(MsgVO vo) throws Exception;	

	public int chat_msg_id(MsgVO vo) throws Exception; 
	
	public void create_msg(MsgVO vo)throws Exception;
	
	public List<MsgVO> msgcontent(MsgVO vo)throws Exception;
	
	public void create_msg_context(MsgVO vo)throws Exception; //고병휘 추가

}
