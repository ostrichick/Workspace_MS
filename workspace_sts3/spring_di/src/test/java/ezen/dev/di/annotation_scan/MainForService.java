package ezen.dev.di.annotation_scan;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

public class MainForService {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppContextService.class);
		
		ConstructorDI constructorDI = ctx.getBean("constructor", ConstructorDI.class);
		constructorDI.processMsg("message sending... katalk");
		
		SetterDI setterDI = ctx.getBean("setter", SetterDI.class);
		setterDI.processMsg("message sending... email");
		
		FieldDI fieldDI = ctx.getBean("field", FieldDI.class);
		fieldDI.processMsg("message sending... email");
		
		ctx.close();
	}
}