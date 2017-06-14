package kosta.koggiri.imageroom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kosta.koggiri.imageroom.domain.ImageroomVO;
import kosta.koggiri.imageroom.persistence.ImageroomDAO;

@Service
public class ImageroomServiceImpl implements ImageroomService {

	@Inject
	private ImageroomDAO dao;
	
	@Override
	public List<ImageroomVO> list(String emp_id) throws Exception {

		return dao.list(emp_id);
	}

}
