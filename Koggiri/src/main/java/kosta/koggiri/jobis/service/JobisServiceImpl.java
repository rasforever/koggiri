package kosta.koggiri.jobis.service;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class JobisServiceImpl implements JobisService {

	@Override
	public String jobis_content(String input_text) throws Exception {

		System.out.println("자비스서비스임플리: " + input_text);
		
		return input_text;

		/*
		 * 
		 * if (input_text.contains("안녕")){ System.out.println("자비스서비스임플리ㅇㅋ : " +
		 * input_text); String re_text = "네 반갑습니다!"; return re_text; }
		 * System.out.println("자비스서비스임플리 ㄴㄴ: " + input_text); return "꺼져"; }
		 */

	}
}
