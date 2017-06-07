package kosta.koggiri.task.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import kosta.koggiri.task.domain.TaskCriteria;
import kosta.koggiri.task.domain.TaskSearchCriteria;
import kosta.koggiri.task.domain.TaskVO;
import kosta.koggiri.task.persistence.TaskDAO;

@Repository
public class TaskServiceImpl implements TaskService {

	@Inject
	private TaskDAO dao;

	@Override
	public void regist(TaskVO task) throws Exception {
		dao.create(task);
	}

	@Override
	public TaskVO read(Integer ta_seq) throws Exception {
		return dao.read(ta_seq);
	}

	@Override
	public void modify(TaskVO task) throws Exception {
		dao.update(task);

	}

	@Override
	public void remove(Integer ta_seq) throws Exception {
		dao.delete(ta_seq);

	}

	@Override
	public int listCountCriteria(TaskCriteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<TaskVO> listSearchCriteria(TaskSearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(TaskSearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
	

}