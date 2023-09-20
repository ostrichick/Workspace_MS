package ezen.dev.di.xml;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainForDi {
	public static void main(String[] args) {
		String path = "classpath:META-INF/spring/app-context.xml";
		AbstractApplicationContext xmlAppCtx = new GenericXmlApplicationContext(path);
		A a = xmlAppCtx.getBean("a", A.class);
		a.methodA();
		B b = xmlAppCtx.getBean("b", B.class);
		b.methodB();
		C c = xmlAppCtx.getBean("c", C.class);
		c.methodC();
		xmlAppCtx.close();
	}
}
