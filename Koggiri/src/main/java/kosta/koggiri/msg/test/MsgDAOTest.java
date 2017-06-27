package kosta.koggiri.msg.test;

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
	
	@Test
	public void test_msg_Count() throws Exception{
		MsgVO vo = new MsgVO();
		vo.setEmp_id("k15010201");
		vo.setN_emp_id("k17060701");
		
		dao.msg_count(vo);
		
	}

}