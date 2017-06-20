package kosta.koggiri.imageroom.service;

import java.util.List;

import kosta.koggiri.imageroom.domain.ImageCaptureVO;

public interface CanvasService {
	public void imageCaptureRegist(ImageCaptureVO imageCapture);
	public List<ImageCaptureVO> imageCaptureList(Integer room_id, String emp_id);
	public Integer nextImageCaptureNoRead();
	public void imageCaptureRemove(Integer image_capture_no);
}
