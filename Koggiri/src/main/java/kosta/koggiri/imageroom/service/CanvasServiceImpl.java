package kosta.koggiri.imageroom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kosta.koggiri.imageroom.domain.ImageCaptureVO;
import kosta.koggiri.imageroom.persistence.CanvasDAO;

@Service
public class CanvasServiceImpl implements CanvasService{
	@Inject
	private CanvasDAO dao;
	
	@Override
	public void imageCaptureRegist(ImageCaptureVO imageCapture) {
		dao.imageCaptureInsert(imageCapture);
	}

	@Override
	public List<ImageCaptureVO> imageCaptureList(Integer room_id, String emp_id) {
		return dao.imageCaptureList(room_id, emp_id);
	}

	@Override
	public Integer nextImageCaptureNoRead() {
		return dao.nextImageCaptureNoSelect();
	}

	@Override
	public void imageCaptureRemove(Integer image_capture_no) {
		dao.imageCaptureDelete(image_capture_no);
	}

	@Override
	public void imageCaptureAlldelete(Integer room_id) {
		// TODO Auto-generated method stub
		dao.imageCaptureAlldelete(room_id);
	}
	
}
