package kosta.koggiri.importantboard.service;

import java.util.List;

import kosta.koggiri.importantboard.domain.Imp_BoardVO;
import kosta.koggiri.importantboard.domain.Imp_Criteria;
import kosta.koggiri.importantboard.domain.Imp_SearchCriteria;


public interface Imp_BoardService {

	public void regist(Imp_BoardVO board)throws Exception;
	
	public Imp_BoardVO read(Integer i_ID)throws Exception;
	
	public void modify(Imp_BoardVO board)throws Exception;
	
	public void remove(Integer i_ID)throws Exception;
	
	public List<Imp_BoardVO> listAll()throws Exception;
		
		public List<Imp_BoardVO> listPage(int page)throws Exception;
		
		public List<Imp_BoardVO> listCriteria(Imp_Criteria cri)throws Exception;

		public int listCountCriteria(Imp_Criteria cri)throws Exception;
		
		public List<Imp_BoardVO> listSearchCriteria(Imp_SearchCriteria cri)throws Exception;
		
		public int listSearchCount(Imp_SearchCriteria cri)throws Exception;
		
		public List<String> getAttach(Integer i_ID)throws Exception;
	}
