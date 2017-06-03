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

	@Override
	public void regist(Doc_BoardVO board) throws Exception {
		
		dao.create(board);
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public Doc_BoardVO read(Integer f_id) throws Exception {
		dao.updateViewCnt(f_id);
		return dao.read(f_id);
	}

	@Override
	public void modify(Doc_BoardVO board) throws Exception {

		dao.update(board);
	}

	@Override
	public void remove(Integer f_id) throws Exception {

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
	
	
	
	
	
	

}
