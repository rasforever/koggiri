package kosta.koggiri.jobis.service;

import org.springframework.stereotype.Service;

@Service
public class JobisServiceImpl implements JobisService{

	@Override
	public String jobis_content(String input_text) throws Exception {
		if (input_text.equals("안녕")){

			return input_text;
		}
		return "꺼져";
	}
	
	

}
