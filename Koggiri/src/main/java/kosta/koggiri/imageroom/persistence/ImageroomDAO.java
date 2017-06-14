package kosta.koggiri.imageroom.persistence;

import java.util.List;
import kosta.koggiri.imageroom.domain.ImageroomVO;

public interface ImageroomDAO {
		
	public List<ImageroomVO> list(String emp_id) throws Exception;
}
