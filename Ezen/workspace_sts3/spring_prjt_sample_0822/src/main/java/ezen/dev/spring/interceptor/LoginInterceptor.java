package ezen.dev.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

//LoginInterceptor는 servlet-context.xml에서 빈으로 등록하므로 애노테이션 없음
public class LoginInterceptor implements HandlerInterceptor {
	// HandlerInerceptor 인터페이스: JDK8이후부터 3개의 디폴트 메소드 있음
	// preHandle(): 컨트롤러 실행 전
	// postHandle(): 컨트롤러 실행 후
	// afterCompletion(): 뷰 실행 후
	// 세 개 중 필요한 메소드를 override 해서 사용
	// 로그인인터셉트는 요청 처리 전에 체크해야하므로 preHandle()사용
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//요청하는 브라우저의 회원인증 여부를 체크해야함 
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		if (member_id == null) {
			response.sendRedirect(request.getContextPath() + "/member_login.do");
			return false;
		}
		return true; // Controller로 사용자 요청이 전달되게 함
	}
}
