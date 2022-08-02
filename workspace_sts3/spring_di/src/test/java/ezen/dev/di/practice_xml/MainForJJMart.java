package ezen.dev.di.practice_xml;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainForJJMart {

	public static void main(String[] args) {
		String path = "classpath:META-INF/spring/app-context_practice.xml";
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(path);
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
