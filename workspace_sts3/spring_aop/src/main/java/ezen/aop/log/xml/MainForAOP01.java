package ezen.aop.log.xml;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainForAOP01 {
	public static void main(String[] args) {
		String path = "classpath:META-INF/spring/app-context_aop_log.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		TargetA a = ctx.getBean("targetA", TargetA.class);
		a.method1();
		a.method2();
		a.method3();
		a.test1();
		a.test2();

		ctx.close();
	}
}
