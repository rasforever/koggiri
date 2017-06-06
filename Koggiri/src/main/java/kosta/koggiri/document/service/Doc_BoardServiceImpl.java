package kosta.koggiri.document.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kosta.koggiri.document.domain.Doc_BoardVO;
import kosta.koggiri.document.domain.Doc_Criteria;
import kosta.koggiri.document.domain.Doc_SearchCriteria;
import kosta.koggiri.document.persistence.Doc_BoardDAO;

@Service
public class Doc_BoardServiceImpl implements Doc_BoardService {

	@Inject
	private Doc_BoardDAO dao;

	@Transactional
	@Override
	public void regist(Doc_BoardVO board) throws Exception {
		
		dao.create(board);
		
		String []files = board.getFiles();
		
		if(files == null){return;}
		
		for(String fileName : files){
			dao.addAttach(fileName);
		}
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public Doc_BoardVO read(Integer f_id) throws Exception {
		dao.updateViewCnt(f_id);
		return dao.read(f_id);
	}

	@Transactional
	@Override
	public void modify(Doc_BoardVO board) throws Exception {

		dao.update(board);
		
		Integer f_id = board.getF_id();
		
		String [] files = board.getFiles();
		
		if(files == null){ return;}
		for(String fileName : files){
			dao.replaceAttach(fileName, f_id);
		}
	}

	@Transactional
	@Override
	public void remove(Integer f_id) throws Exception {
		dao.deleteAttach(f_id);
		dao.delete(f_id);
	}

	
	@Override
	public List<Doc_BoardVO> listSearchCriteria(Doc_SearchCriteria cri) throws Exception {
		
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(Doc_SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getAttach(Integer f_id) throws Exception {
		
		return dao.getAttach(f_id);
	}
	
	
	
	
	
	
	
	

}
