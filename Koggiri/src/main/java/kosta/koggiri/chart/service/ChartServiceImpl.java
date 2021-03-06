package kosta.koggiri.chart.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kosta.koggiri.chart.domain.ChartVO;
import kosta.koggiri.chart.persistence.ChartDAO;

@Service
public class ChartServiceImpl implements ChartService {

	@Inject
	private ChartDAO dao;

	@Override
	public List<ChartVO> list(String dept_id) throws Exception {
		System.out.println(dept_id);
		return dao.list(dept_id);
	}

	@Override
	public ChartVO read(String emp_id) throws Exception {

		return dao.read(emp_id);
	}
	
	@Override
	public ChartVO listAll() throws Exception {

		return dao.listAll();
	}

}
