package kosta.koggiri.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kosta.koggiri.home.domain.H_NoticeVO;
import kosta.koggiri.home.domain.H_calendarVO;
import kosta.koggiri.home.domain.H_importantVO;
import kosta.koggiri.home.persistence.HomeDAO;

@Service
public class HomeServiceImpl implements HomeService {

	@Inject
	private HomeDAO dao;

	@Override
	public List<H_NoticeVO> list_notice() throws Exception {
		return dao.list_notice();
	}

	@Override
	public List<H_importantVO> list_important() throws Exception {
		return dao.list_important();
	}

	@Override
	public List<H_calendarVO> list_calendar() throws Exception {
		return dao.list_calendar();
	}

	
	
	

}
