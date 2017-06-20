package kosta.koggiri.imageroom.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.koggiri.imageroom.domain.ImageCaptureVO;


@Repository
public class CanvasDAOImpl implements CanvasDAO{
	private static final String NAMESPACE = "kosta.koggiri.mapper.CanvasMapper";
	
	@Inject
	private SqlSession session;

	@Override
	public void imageCaptureInsert(ImageCaptureVO imageCapture) {
		session.insert(NAMESPACE + ".imageCaptureInsert", imageCapture);
	}

	@Override
	public List<ImageCaptureVO> imageCaptureList(Integer room_id, String emp_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("room_id", room_id);
		map.put("emp_id", emp_id);
		
		return session.selectList(NAMESPACE + ".imageCaptureList", map);
	}

	@Override
	public Integer nextImageCaptureNoSelect() {
		return session.selectOne(NAMESPACE + ".nextImageCaptureNoSelect");
	}

	@Override
	public void imageCaptureDelete(Integer image_capture_no) {
		session.delete(NAMESPACE + ".imageCaptureDelete", image_capture_no);
	}
	
	
}
