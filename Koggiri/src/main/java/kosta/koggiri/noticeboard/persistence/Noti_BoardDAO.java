package kosta.koggiri.noticeboard.persistence;

import java.util.List;

import kosta.koggiri.noticeboard.domain.Noti_Criteria;
import kosta.koggiri.noticeboard.domain.Noti_SearchCriteria;
import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.noticeboard.domain.Noti_BoardVO;


public interface Noti_BoardDAO {
	public void create(Noti_BoardVO vo) throws Exception;
	
	public Noti_BoardVO read(Integer n_ID)throws Exception;
	
	public void update(Noti_BoardVO vo)throws Exception;
	
	public void delete(Integer n_ID)throws Exception;
	
	public List<Noti_BoardVO> listAll()throws Exception;
	
	public List<Noti_BoardVO> listPage(int page)throws Exception;
	
	public List<Noti_BoardVO> listCriteria(Noti_Criteria cri)throws Exception;
	
	public int countPaging(Noti_Criteria cri) throws Exception;
	
	public List<Noti_BoardVO> listSearch(Noti_SearchCriteria cri)throws Exception;
	
	public int listSearchCount(Noti_SearchCriteria cri)throws Exception;

	public void addAttach(String fullName) throws Exception;
	
	public List<String> getAttach(Integer n_ID)throws Exception;
	
	public void deleteAttach(Integer n_ID)throws Exception;
	public void replaceAttach(String fullName, Integer n_ID)throws Exception;
	
	public void updateViewCnt(Integer n_ID)throws Exception;
	
	//자비스 추가
	public List<Noti_BoardVO> SearchId(Noti_BoardVO vo) throws Exception;
	public int SearchId_count(Noti_BoardVO vo) throws Exception;

}
