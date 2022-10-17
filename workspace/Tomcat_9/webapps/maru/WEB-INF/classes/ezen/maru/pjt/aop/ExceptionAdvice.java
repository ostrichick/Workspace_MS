package ezen.maru.pjt.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import ezen.maru.pjt.exception.AjaxException;

@Aspect
public class ExceptionAdvice {

	private static final Logger logger = LoggerFactory.getLogger(ExceptionAdvice.class);

	@AfterThrowing(pointcut = "execution(* com.tistory.pentode.*Controller.*(..))", throwing = "exception")
	public void afterThrowingMethod(JoinPoint jp, Exception exception) throws Exception {

		logger.info("AfterThrowing ======================================================");

		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attr.getRequest();

		if ("true".equals(request.getHeader("AjaxCall"))) {
			throw new AjaxException("AjaxException 발생", exception);
		}
	}
}