package kosta.koggiri.imageroom.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kosta.koggiri.imageroom.domain.ImageroomDTO;
import kosta.koggiri.imageroom.domain.ImageroomVO;
import kosta.koggiri.imageroom.service.ImageroomService;

@Controller
@RequestMapping("/imageRoom/*")
public class ImageroomController {
	
	@Inject
	private ImageroomService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model,HttpSession session)throws Exception{
		System.out.println("아왜안됨");
		String mem_id = (String) session.getAttribute("mem_id");
		String emp_nm = (String) session.getAttribute("emp_nm");
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("emp_nm", emp_nm);
		return "imageroom/list";
	}
	
	//로비에 방 리스트 전송
	@ResponseBody
	@RequestMapping(value="/imageRoomLobby", method=RequestMethod.GET)
	public ResponseEntity<List<ImageroomDTO>> imageRoomListGET(){
		ResponseEntity<List<ImageroomDTO>> entity = null;
		
		try {
			List<ImageroomDTO> list = service.imageRoomList();
			
			entity = new ResponseEntity<List<ImageroomDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<ImageroomDTO>>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
	}
	
	
	//db로 방 전송
	@ResponseBody
	@RequestMapping(value="/imageRoomLobby", method=RequestMethod.POST)
	public ResponseEntity<String> createRoom(ImageroomVO imageRoom){
		ResponseEntity<String> entity = null;
		
		System.out.println(imageRoom);
		
		try {
			service.imageRoomRegist(imageRoom);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	//emp 정보 가져와서 node에 보냄 부서나 직급등등
	@ResponseBody
	@RequestMapping(value="/getEmp")
	public ResponseEntity<ImageroomDTO> getEmp(@RequestParam("emp_id") String emp_id){
		ResponseEntity<ImageroomDTO> entity = null;
		
		try {
			ImageroomDTO emp = service.empRead(emp_id);
			System.out.println(emp);
			emp.setEmp_id(emp_id);
			entity = new ResponseEntity<ImageroomDTO>(emp, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<ImageroomDTO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	//방삭제
	@ResponseBody
	@RequestMapping(value="/imageRoomDelete", method=RequestMethod.POST)
	public ResponseEntity<String> imageCaptureDelete(@RequestParam("room_id") Integer room_id){
		ResponseEntity<String> entity = null;
		
		try {
			service.imageRoomRemove(room_id);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/getRoomNo")
	public ResponseEntity<Integer> getRoomNo(){
		ResponseEntity<Integer> entity = null;
		
		try {
			Integer room_id = service.nextRoomNoRead();

			entity = new ResponseEntity<Integer>(room_id, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
