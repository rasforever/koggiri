package kosta.koggiri.noticeboard.service;

import java.util.List;

import kosta.koggiri.noticeboard.domain.Noti_BoardVO;
import kosta.koggiri.noticeboard.domain.Noti_Criteria;
import kosta.koggiri.noticeboard.domain.Noti_SearchCriteria;

public interface Noti_BoardService {
	public void regist(Noti_BoardVO board)throws Exception;
	
	public Noti_BoardVO read(Integer n_ID)throws Exception;
	
	public void modify(Noti_BoardVO board)throws Exception;
	
	public void remove(Integer n_ID)throws Exception;
	
	public List<Noti_BoardVO> listAll()throws Exception;
	
	public List<Noti_BoardVO> listPage(int page)throws Exception;
	
	public List<Noti_BoardVO> listCriteria(Noti_Criteria cri)throws Exception;

	public int listCountCriteria(Noti_Criteria cri)throws Exception;
	
	public List<Noti_BoardVO> listSearchCriteria(Noti_SearchCriteria cri)throws Exception;
	
	public int listSearchCount(Noti_SearchCriteria cri)throws Exception;
	
	public List<String> getAttach(Integer n_ID)throws Exception;
}
