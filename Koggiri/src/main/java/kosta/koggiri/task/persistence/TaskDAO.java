package kosta.koggiri.task.persistence;

import java.util.List;

import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.domain.Doc_SearchCriteria;
import kosta.koggiri.task.domain.TaskCriteria;
import kosta.koggiri.task.domain.TaskSearchCriteria;
import kosta.koggiri.task.domain.TaskVO;

public interface TaskDAO {
   
   public void create(TaskVO vo)throws Exception;
   
   public TaskVO read(Integer ta_seq)throws Exception;
   
   public void update(TaskVO vo)throws Exception;
   
   public void delete(Integer ta_seq)throws Exception;
   
   public List<TaskVO> listAll()throws Exception;
   
   public List<TaskVO> listPage(int page)throws Exception;
   
   public List<TaskVO> listCriteria(TaskCriteria cri)throws Exception;
   
   public int countPaging(TaskCriteria cri)throws Exception;
   
	public List<TaskVO> listSearch(TaskSearchCriteria cri)throws Exception;
	
	public int listSearchCount(TaskSearchCriteria cri)throws Exception;

}