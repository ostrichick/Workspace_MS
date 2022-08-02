package ezen.aop.log.xml;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

public class LogAdvisor {
	
	public void logBefore() {
		System.out.println("메소드 실행 전 로깅: logBefore");
	}
	
	public void logAfter() {
		System.out.println("메소드 실행 후 로깅: logAfter");
	}
	
	public void logAfterReturning() {
		System.out.println("결과값 반환 후 로깅: logAfterReturning");
	}
	
	public void logAfterThrowing(JoinPoint joinPoint, Throwable e) {
		System.out.println("예외 발생 후 로깅: logAfterThrowing");
		System.out.println("발생한 예외: "+e.getMessage());
	}
	
	public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable{
		String className = joinPoint.getTarget().getClass().getSimpleName();
		String methodName = joinPoint.getSignature().getName();
		
		System.out.println(className+"의 "+methodName+"메소드 실행 전 로깅: logAround");
		Object obj = joinPoint.proceed();
		System.out.println(className+"의 "+methodName+"메소드 실행 후 로깅: logAround");
		
		return obj;
	}

}
