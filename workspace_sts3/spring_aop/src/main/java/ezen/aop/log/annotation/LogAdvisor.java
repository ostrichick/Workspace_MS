package ezen.aop.log.annotation;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogAdvisor {
	@Pointcut("execution(* ezen.apo..TargetB.method*())")
	public void targetMethod() {
	}// 임의의 메소드를 정의해서 변수처럼 사용

	@Before("targetMethod()")
	public void logBefore() {
		System.out.println("메소드 실행 전 로깅: logBefore");
	}

	@After("targetMethod()")
	public void logAfter() {
		System.out.println("메소드 실행 후 로깅: logAfter");
	}

	@AfterReturning("targetMethod()")
	public void logAfterReturning() {
		System.out.println("결과값 반환 후 로깅: logAfterReturning");
	}

	@AfterThrowing("targetMethod()")
	public void logAfterThorwing(JoinPoint joinPoint, Throwable e) {
		System.out.println("쓰로잉 후 로깅 : logAfterThrowing");
		System.out.println("발생한 예외 : " + e.getMessage());
	}

	@Around("targetMethod()")
	public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
		String className = joinPoint.getTarget().getClass().getSimpleName();
		String methodName = joinPoint.getSignature().getName();
		System.out.println(className + " 의 " + methodName + " 메소드 실행 전 로깅 : logAround");
		Object obj = joinPoint.proceed();
		System.out.println(className + " 의 " + methodName + " 메소드 실행 후 로깅 : logAround");
		return obj;
	}
}
