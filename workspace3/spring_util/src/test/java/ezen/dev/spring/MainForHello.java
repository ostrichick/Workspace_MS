package ezen.dev.spring;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class MainForHello {
	public static void main(String[] args) {
		AnnotationConfigApplicationContext annoAppCtx = new AnnotationConfigApplicationContext(AppContext.class);
		Hello hello = annoAppCtx.getBean("hello", Hello.class);
		hello.setGreeting("Hello, Spring!");
		System.out.println(hello.getGreeting());
		annoAppCtx.close();
	}
}
