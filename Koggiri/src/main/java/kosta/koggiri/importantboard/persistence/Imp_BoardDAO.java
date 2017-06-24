package kosta.koggiri.importantboard.persistence;

import java.util.List;

import kosta.koggiri.importantboard.domain.Imp_BoardVO;
import kosta.koggiri.importantboard.domain.Imp_Criteria;
import kosta.koggiri.importantboard.domain.Imp_SearchCriteria;


public interface Imp_BoardDAO {

	public void create(Imp_BoardVO vo) throws Exception;
	
	public Imp_BoardVO read(Integer i_ID)throws Exception;
	
	public void update(Imp_BoardVO vo)throws Exception;
	
	public void delete(Integer i_ID)throws Exception;
	
	public List<Imp_BoardVO> listAll()throws Exception;
	
	public List<Imp_BoardVO> listPage(int page)throws Exception;
	
	public List<Imp_BoardVO> listCriteria(Imp_Criteria cri)throws Exception;
	
	public int countPaging(Imp_Criteria cri) throws Exception;
	
	public List<Imp_BoardVO> listSearch(Imp_SearchCriteria cri)throws Exception;
	
	public int listSearchCount(Imp_SearchCriteria cri)throws Exception;

	public void addAttach(String fullName) throws Exception;
	
	public List<String> getAttach(Integer i_ID)throws Exception;
	
	public void deleteAttach(Integer i_ID)throws Exception;
	public void replaceAttach(String fullName, Integer i_ID)throws Exception;
	
	public void updateViewCnt(Integer i_ID)throws Exception;
	
	public int SearchId(Imp_BoardVO vo) throws Exception;
	public int SearchId_count(Imp_BoardVO vo) throws Exception;
}
