package kosta.koggiri.msg.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kosta.koggiri.msg.domain.MsgVO;
import kosta.koggiri.msg.persistence.MsgDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MsgDAOTest {
	
	@Inject
	private MsgDAO dao;
	
	
	//서로의 메세지 확인
	@Test
	public void test_msg_Count() throws Exception{
		MsgVO vo = new MsgVO();
		vo.setEmp_id("k15010201");
		vo.setN_emp_id("k17060701");
		
		dao.msg_count(vo);
		
	}
	
	//대화상대와 방 있나 체크하고 방 생성 혹은 방 접속하기
	@Test
	public void test_create_msg() throws Exception{
		MsgVO vo = new MsgVO();
		vo.setEmp_id("k15010201");
		vo.setN_emp_id("k17060701");
		
		dao.create_msg(vo);		
		
	}
	
	//대화방 내용 가져오기
	@Test
	public void test_msgcontent() throws Exception{
		MsgVO vo = new MsgVO();
		vo.setMsg_id(1);		
		dao.msgcontent(vo);
		
	}
	
/*	//대화 내용 입력시 마다 저장
	@Test
	public void test_create_msg_context() throws Exception{
		MsgVO vo = new MsgVO();
		vo.setMsg_id(1);		
		vo.setEmp_id("k15010201");
		vo.setInput_text("반갑다 하지만 우리는 이제 헤어져야할 시간 다음에 또 만나요");
		dao.create_msg_context(vo);
	}*/

}