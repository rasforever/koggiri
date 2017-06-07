package kosta.koggiri.chart.service;

import java.util.List;

import kosta.koggiri.chart.domain.ChartVO;

public interface ChartService {

	public List<ChartVO> MM() throws Exception;
	
	public ChartVO read(String emp_id) throws Exception;
	
}
