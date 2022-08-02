package ezen.aop.log.annotation;

import org.springframework.stereotype.Component;

@Component
public class TargetB {
	public void method1() {
		System.out.println("TargetB클래스의 method1 실행");
	}

	public void method2() {
		System.out.println("TargetB클래스의 method2 실행");
	}

	public void method3() {
		System.out.println("TargetB클래스의 method3 실행");
	}

	public String test1() {
		System.out.println("TargetB 클래스의 test1 실행");
		return "AOP테스트";
	}

	public void test2() {
		try {
			int result = 100 / 0;
//		} catch (Exception e) {
//			e.printStackTrace();
		} finally {
			System.out.println("TargetB의 test2 실행");
		}
	}
}
