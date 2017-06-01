package kosta.koggiri.document.service;

import java.util.List;

import kosta.koggiri.document.domain.Doc_BoardVO;

public interface Doc_BoardService {
	
	public void regist(Doc_BoardVO board)throws Exception;
	
	public Doc_BoardVO read(Integer f_id)throws Exception;
	
	public void modify(Doc_BoardVO board)throws Exception;
	
	public void remove(Integer f_id)throws Exception;
	
	public List<Doc_BoardVO> listAll()throws Exception;

}
