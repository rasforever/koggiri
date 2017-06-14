package kosta.koggiri.imageroom.service;

import java.util.List;

import kosta.koggiri.imageroom.domain.ImageroomVO;

public interface ImageroomService {
	
	public List<ImageroomVO> list(String emp_id) throws Exception;
}
