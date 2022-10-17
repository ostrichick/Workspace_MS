package ezen.maru.pjt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String member_admin = (String) session.getAttribute("member_admin");
		if (member_admin == null || !member_admin.equals("Y")) {
			System.out.println("null이거나, Y가아님");
			response.sendRedirect(request.getContextPath() + "/error");
			return false;
		}
		return true;
	}
}
