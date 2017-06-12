package kosta.koggiri.importantboard.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kosta.koggiri.importantboard.domain.Imp_BoardVO;
import kosta.koggiri.importantboard.domain.Imp_Criteria;
import kosta.koggiri.importantboard.domain.Imp_SearchCriteria;
import kosta.koggiri.importantboard.persistence.Imp_BoardDAO;

@Service
public class Imp_BoardServiceImpl implements Imp_BoardService{


	@Inject
	private Imp_BoardDAO dao;
	
	@Transactional
	@Override
	public void regist(Imp_BoardVO board) throws Exception {
		dao.create(board);
		
		String[] files = board.getFiles();
		
		if (files == null) {
			return;
		}
		for (String fileName : files) {
			dao.addAttach(fileName);
		}

	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public Imp_BoardVO read(Integer i_ID) throws Exception {
		dao.updateViewCnt(i_ID);
		return dao.read(i_ID);
	}

	@Transactional
	@Override
	public void modify(Imp_BoardVO board) throws Exception {
		dao.update(board);
		
		Integer i_ID = board.getI_ID();
		
		dao.deleteAttach(i_ID);
		
		String[] files = board.getFiles();
		
		if(files == null){ return;}
		for(String fileName : files){
			dao.replaceAttach(fileName, i_ID);
		}
	}

	@Transactional
	@Override
	public void remove(Integer i_ID) throws Exception {
		dao.deleteAttach(i_ID);
		dao.delete(i_ID);
	}

	@Override
	public List<Imp_BoardVO> listAll() throws Exception {
		System.out.println("1");
		return dao.listAll();
	}

	@Override
	public List<Imp_BoardVO> listPage(int page) throws Exception {
		return dao.listPage(page);
	}
	
	@Override
	public List<Imp_BoardVO> listCriteria(Imp_Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Imp_Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<Imp_BoardVO> listSearchCriteria(Imp_SearchCriteria cri) throws Exception {
		
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(Imp_SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getAttach(Integer i_ID) throws Exception {
		return dao.getAttach(i_ID);
	}


}
