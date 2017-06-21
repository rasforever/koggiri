package kosta.koggiri.jobis.service;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class JobisServiceImpl implements JobisService {

	@Override
	public String jobis_content(String input_text) throws Exception {

		if (input_text.contains("안녕")) {
			System.out.println("자비스서비스임플리ㅇㅋ : " + input_text);

			return "네 반갑습니다!";
		} else if (input_text.contains("잘가")) {

			return "꺼져이새끼야";
		} else if (input_text.contains("유승현")) {

			return "원빈?";
		}
		return "잘 못알아 들었어요";
	}
}
