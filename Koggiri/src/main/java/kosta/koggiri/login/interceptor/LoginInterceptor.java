package kosta.koggiri.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kosta.koggiri.login.domain.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		System.out.println("login prehandler");
		if (session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			System.out.println(" iflogin prehandler");
			session.removeAttribute(LOGIN);
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception { 
HttpSession session = request.getSession();
		
		
		ModelMap modelmap = modelAndView.getModelMap();
		
		MemberVO memberVO = (MemberVO) modelmap.get("memberVO");
		String emp_nm =(String) modelmap.get("empnm");
		System.out.println("session: "+memberVO.toString());
		System.out.println("session: "+ emp_nm);
		if(memberVO !=null){
			
			
			
			session.setAttribute(LOGIN, memberVO); // 로그인 정보 저장
			
			session.setAttribute("mem_id", memberVO.getMem_id());// 아이디 세션 저장
			session.setAttribute("emp_nm", emp_nm); // 세션 이름저장
			System.out.println(emp_nm + " " + memberVO.getMem_id());
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest !=null ? (String)dest:"/");
		}


	}

}
