package ezen.dev.di.practice_anno;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

public class MainForJJMart {

	public static void main(String[] args) {
//		String path = "classpath:META-INF/spring/app-context_practice.xml";
		AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppContextJJMart.class);
		JeonjuMart jjMart = ctx.getBean("jjMart", JeonjuMart.class);
		jjMart.showProducts();
		ctx.close();
//		Product p_samsung = xmlAppCtx.getBean("p_samsung", Product.class);
//		Product p_lg = xmlAppCtx.getBean("p_lg", Product.class);
//		Product p_apple = xmlAppCtx.getBean("p_apple", Product.class);
//		xmlAppCtx.close();
//		
//		JeonjuMart jjMart = new JeonjuMart(p_samsung, p_lg, p_apple);
//		jjMart.showProducts();
	}

}
