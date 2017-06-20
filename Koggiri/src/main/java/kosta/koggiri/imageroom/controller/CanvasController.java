package kosta.koggiri.imageroom.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.koggiri.imageroom.domain.ImageCaptureVO;
import kosta.koggiri.imageroom.service.CanvasService;


@Controller
@RequestMapping(value="/canvas/*")
public class CanvasController {
	@Inject
	private CanvasService service;

	@ResponseBody
	@RequestMapping(value="/imageCapture", method=RequestMethod.GET)
	public ResponseEntity<List<ImageCaptureVO>> imageCaptureGET(@RequestParam("room_id") Integer room_id
																,@RequestParam("emp_id") String emp_id){
		ResponseEntity<List<ImageCaptureVO>> entity = null;
		System.out.println(room_id+"dd"+emp_id);
		try {
			List<ImageCaptureVO> list = service.imageCaptureList(room_id, emp_id);

			entity = new ResponseEntity<List<ImageCaptureVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ImageCaptureVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	@ResponseBody
	@RequestMapping(value="/imageCapture", method=RequestMethod.POST)
	public ResponseEntity<String> imageCapturePOST(ImageCaptureVO imageCapture){
		ResponseEntity<String> entity = null;
		
		try {
			service.imageCaptureRegist(imageCapture);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/imageCaptureDelete", method=RequestMethod.POST)
	public ResponseEntity<String> imageCaptureDelete(@RequestParam("image_capture_no") Integer image_capture_no){
		ResponseEntity<String> entity = null;
		
		try {
			service.imageCaptureRemove(image_capture_no);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/getImageCaptureNo")
	public ResponseEntity<Integer> getImageCaptureNo(){
		ResponseEntity<Integer> entity = null;
		
		try {
			Integer imageCaptureNo = service.nextImageCaptureNoRead();

			entity = new ResponseEntity<Integer>(imageCaptureNo, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
