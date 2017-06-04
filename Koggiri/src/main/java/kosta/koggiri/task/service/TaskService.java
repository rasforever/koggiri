package kosta.koggiri.task.service;

import java.util.List;

import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.domain.Doc_SearchCriteria;
import kosta.koggiri.task.domain.TaskCriteria;
import kosta.koggiri.task.domain.TaskSearchCriteria;
import kosta.koggiri.task.domain.TaskVO;

public interface TaskService {
	
	public void regist(TaskVO task)throws Exception;
	
	public TaskVO read(Integer ta_seq)throws Exception;
	
	public void modify(TaskVO task)throws Exception;
	
	public void remove(Integer ta_seq)throws Exception;
	
	public int listCountCriteria(TaskCriteria cri)throws Exception;
	
	public List<TaskVO> listSearchCriteria(TaskSearchCriteria cri)throws Exception;
	
	public int listSearchCount(TaskSearchCriteria cri)throws Exception;

}
