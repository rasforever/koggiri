package kosta.koggiri.task.persistence;

import java.util.List;

import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.domain.Doc_SearchCriteria;
import kosta.koggiri.task.domain.TaskCriteria;
import kosta.koggiri.task.domain.TaskSearchCriteria;
import kosta.koggiri.task.domain.TaskVO;

public interface TaskDAO {
   //등록
   public void create(TaskVO vo)throws Exception;
   //상세보기
   public TaskVO read(Integer ta_seq)throws Exception;
   //수정
   public void update(TaskVO vo)throws Exception;
   //삭제
   public void delete(Integer ta_seq)throws Exception;
   //리스트보여주고 서치작업
	public List<TaskVO> listSearch(TaskSearchCriteria cri)throws Exception;
   //서치에서 페이징	
	public int listSearchCount(TaskSearchCriteria cri)throws Exception;
   //조회수 올림
	public void updateViewCnt(Integer ta_seq)throws Exception;

}