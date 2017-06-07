package kosta.koggiri.task.service;

import java.util.List;

import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.domain.Doc_SearchCriteria;
import kosta.koggiri.task.domain.TaskCriteria;
import kosta.koggiri.task.domain.TaskSearchCriteria;
import kosta.koggiri.task.domain.TaskVO;

public interface TaskService {
	//등록
	public void regist(TaskVO task)throws Exception;
    //상세보기	
	public TaskVO read(Integer ta_seq)throws Exception;
	//수정
	public void modify(TaskVO task)throws Exception;
	//삭제
	public void remove(Integer ta_seq)throws Exception;
	//서치해서 리스트같이 보여주기
	public List<TaskVO> listSearchCriteria(TaskSearchCriteria cri)throws Exception;
	//서치와 페이징(페이징과 동시에 서치에서 페이징도 보여준다)
	public int listSearchCount(TaskSearchCriteria cri)throws Exception;

}
