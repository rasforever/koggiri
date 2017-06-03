package kosta.koggiri.document.persistence;

import java.util.List;

import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.domain.Doc_Criteria;
import kosta.koggiri.document.domain.Doc_SearchCriteria;

public interface Doc_BoardDAO {
	
	public void create(Doc_BoardVO vo)throws Exception;
	
	public Doc_BoardVO read(Integer f_id)throws Exception;
	
	public void update(Doc_BoardVO vo)throws Exception;
	
	public void delete(Integer f_id)throws Exception;
	
	public List<Doc_BoardVO> listSearch(Doc_SearchCriteria cri)throws Exception;
	
	public int listSearchCount(Doc_SearchCriteria cri)throws Exception;
	
	public void updateViewCnt(Integer f_id)throws Exception;
	

}
