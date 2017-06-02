package kosta.koggiri.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private void saveDest(HttpServletRequest req){
		
		String uri = req.getRequestURI();
		
		String query = req.getQueryString();
		
		if(query ==null || query.equals("null")){
			query = "";
		}else{
			query= "?" + query;
		}
		
		if(req.getMethod().equals("GET")){
			req.getSession().setAttribute("dest", uri+query);
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null){
			System.out.println("auth prehandler");
			saveDest(request);
			
			response.sendRedirect("/login");
			return false;
		}
		return true;
	}
	
	
	
}
