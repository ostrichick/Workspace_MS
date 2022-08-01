package ezen.dev.di.annotation;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

public class MainForDi2 {
	public static void main(String[] args) {

		AbstractApplicationContext annoAppCtx = new AnnotationConfigApplicationContext(AppContext.class);
		A a = annoAppCtx.getBean("a", A.class);
		a.methodA();
		B b = annoAppCtx.getBean("b", B.class);
		b.methodB();
		C c = annoAppCtx.getBean("c", C.class);
		c.methodC();
		annoAppCtx.close();
	}
}
