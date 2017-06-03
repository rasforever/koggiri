package kosta.koggiri.document.persistence;

import java.util.List;

import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.domain.Doc_Criteria;
import kosta.koggiri.document.domain.Doc_SearchCriteria;

public interface Doc_BoardDAO {
	//글 작성 기능
	public void create(Doc_BoardVO vo)throws Exception;
	
	//글 세부 보기 기능
	public Doc_BoardVO read(Integer f_id)throws Exception;
	
	//글 수정 기능
	public void update(Doc_BoardVO vo)throws Exception;
	
	//글 삭제 기능
	public void delete(Integer f_id)throws Exception;
	
	public List<Doc_BoardVO> listSearch(Doc_SearchCriteria cri)throws Exception;
	
	public int listSearchCount(Doc_SearchCriteria cri)throws Exception;
	
	//조회수 카운트 기능
	public void updateViewCnt(Integer f_id)throws Exception;
	
	//첨부파일 추가 기능 (주의: 새롭게 생성된 게시물의 번호가 필요)
	public void addAttach(String fullName)throws Exception;
}
