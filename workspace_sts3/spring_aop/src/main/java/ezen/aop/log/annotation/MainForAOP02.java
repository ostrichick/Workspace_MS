package ezen.aop.log.annotation;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

public class MainForAOP02 {

	public static void main(String[] args) {
		AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppContextAop.class);
		TargetB b = ctx.getBean("targetB", TargetB.class);
		b.method1();
		b.method2();
		b.method3();
		b.test1();
		b.test2();

		ctx.close();
	}
}
