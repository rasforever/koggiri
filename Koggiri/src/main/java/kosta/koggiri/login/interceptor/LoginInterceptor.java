package kosta.koggiri.login.interceptor;

import java.io.PrintWriter;

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
		
		
		if(memberVO !=null){
			
			
			
			session.setAttribute(LOGIN, memberVO); // 로그인 정보 저장
			
			session.setAttribute("mem_id", memberVO.getMem_id());// 아이디 세션 저장
			session.setAttribute("emp_nm", emp_nm); // 세션 이름저장

			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest !=null ? (String)dest:"/");
		}else{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 실패하였습니다.');");
			out.println("location.href='/login';");
			out.println("</script>");
			out.close();
		}


	}

}
