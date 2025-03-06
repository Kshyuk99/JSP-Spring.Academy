package chap02;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main2 {
	public static void main(String[] args) {
		
		AnnotationConfigApplicationContext ctx = 
				new AnnotationConfigApplicationContext(AppContext.class);
//		HelloWorld helloworld = new HelloWorld();
//		helloworld.print();
		
		HelloWorld helloworld = ctx.getBean(HelloWorld.class);
		HelloWorld helloworld1 = ctx.getBean(HelloWorld.class);
		helloworld.print();
		System.out.println(helloworld == helloworld1);
		
		ctx.close();
	}
 
}
