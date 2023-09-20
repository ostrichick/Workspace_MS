package ezen.dev.di.practice_scan;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainForJJMart {

	public static void main(String[] args) {
		String path = "classpath:META-INF/spring/app-context_practice_scan.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		JeonjuMart jjMart = ctx.getBean("jjMart", JeonjuMart.class);
		jjMart.showProducts();
		ctx.close();
	}
}
