package kosta.koggiri.imageroom.persistence;

import java.util.List;

import kosta.koggiri.imageroom.domain.ImageCaptureVO;



public interface CanvasDAO {
	public void imageCaptureInsert(ImageCaptureVO imageCapture);
	public void imageCaptureDelete(Integer image_capture_no);
	public List<ImageCaptureVO> imageCaptureList(Integer room_id, String emp_id);
	public Integer nextImageCaptureNoSelect();
	public void imageCaptureAlldelete(Integer room_id);
}
