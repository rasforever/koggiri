package kosta.koggiri.document.persistence;

import java.util.List;

import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.domain.Doc_Criteria;
import kosta.koggiri.document.domain.Doc_SearchCriteria;
import kosta.koggiri.importantboard.domain.Imp_BoardVO;

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
	
	//특정 게시물의 첨부파일을 시간 순서대로 가져오는 기능
	public List<String> getAttach(Integer f_id)throws Exception;
	
	//기존첨부파일 삭제하고 새로운 파일을 첨부하기
	public void deleteAttach(Integer f_id)throws Exception;
	public void replaceAttach(String fullName, Integer f_id)throws Exception;
	
	//자비스 추가
	public List<Doc_BoardVO> SearchId(Doc_BoardVO vo) throws Exception;
	public int SearchId_count(Doc_BoardVO vo) throws Exception;
}
