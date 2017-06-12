package kosta.koggiri.home.service;

import java.util.List;
import kosta.koggiri.home.domain.H_NoticeVO;
import kosta.koggiri.home.domain.H_calendarVO;
import kosta.koggiri.home.domain.H_importantVO;

public interface HomeService {
	
	public List<H_NoticeVO>list_notice() throws Exception; 
	
	public List<H_importantVO>list_important()throws Exception;
	
	public List<H_calendarVO>list_calendar(String emp_id)throws Exception;
	
	
	
	

}
