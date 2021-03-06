package kosta.koggiri.noticeboard.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kosta.koggiri.noticeboard.domain.Noti_BoardVO;
import kosta.koggiri.noticeboard.domain.Noti_Criteria;
import kosta.koggiri.noticeboard.domain.Noti_SearchCriteria;
import kosta.koggiri.noticeboard.persistence.Noti_BoardDAO;

@Service
public class Noti_BoardServiceImpl implements Noti_BoardService {

	@Inject
	private Noti_BoardDAO dao;
	
	@Transactional
	@Override
	public void regist(Noti_BoardVO board) throws Exception {
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
	public Noti_BoardVO read(Integer n_ID) throws Exception {
		dao.updateViewCnt(n_ID);
		return dao.read(n_ID);
	}

	@Transactional
	@Override
	public void modify(Noti_BoardVO board) throws Exception {
		dao.update(board);
		
		Integer n_ID = board.getN_ID();
		
		dao.deleteAttach(n_ID);
		
		String[] files = board.getFiles();
		
		if(files == null){ return;}
		for(String fileName : files){
			dao.replaceAttach(fileName, n_ID);
		}
	}

	@Transactional
	@Override
	public void remove(Integer n_ID) throws Exception {
		dao.deleteAttach(n_ID);
		dao.delete(n_ID);
	}

	@Override
	public List<Noti_BoardVO> listAll() throws Exception {
		System.out.println("1");
		return dao.listAll();
	}

	@Override
	public List<Noti_BoardVO> listPage(int page) throws Exception {
		return dao.listPage(page);
	}
	
	@Override
	public List<Noti_BoardVO> listCriteria(Noti_Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Noti_Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<Noti_BoardVO> listSearchCriteria(Noti_SearchCriteria cri) throws Exception {
		
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(Noti_SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getAttach(Integer n_ID) throws Exception {
		return dao.getAttach(n_ID);
	}

}
