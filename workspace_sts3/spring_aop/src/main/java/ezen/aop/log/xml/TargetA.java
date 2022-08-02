package ezen.aop.log.xml;

import org.springframework.stereotype.Component;

@Component
public class TargetA {
	public void method1() {
		System.out.println("TargetA클래스의 method1 실행");
	}

	public void method2() {
		System.out.println("TargetA클래스의 method2 실행");
	}

	public void method3() {
		System.out.println("TargetA클래스의 method3 실행");
	}

	public String test1() {
		System.out.println("TargetA 클래스의 test1 실행");
		return "AOP테스트";
	}

	public void test2() {
		try {
			int result = 100 / 0;
//		} catch (Exception e) {
//			e.printStackTrace();
		} finally {
			System.out.println("TargetA의 test2 실행");
		}
	}
}
