package ezen.maru.pjt.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {

//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		HttpSession session = request.getSession();
//		String member_admin = (String) session.getAttribute("member_admin");
//		System.out.println(member_admin == null);
//		System.out.println(member_admin);
////		System.out.println(!member_admin.equals("Y"));
//		if (member_admin != null && !member_admin.equals("Y")) {
//			System.out.println("널이아님 && Y가아님");
//			response.sendRedirect(request.getContextPath() + "/member/signin");
//			return false;
//		}
//		return true;
//	}
}
