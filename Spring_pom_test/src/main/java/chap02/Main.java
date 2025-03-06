package chap02;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {
	public static void main(String[] args) {
		Greeter greeter = new Greeter();
		greeter.setFormat("%s");
		System.out.println(greeter.greet("안녕"));
		AnnotationConfigApplicationContext ctx = 
				new AnnotationConfigApplicationContext(AppContext.class);
		Greeter g1 = ctx.getBean("greeter", Greeter.class);
		Greeter g2 = ctx.getBean("greeter", Greeter.class);
		System.out.println("(g1==g2) = " + (g1 == g2));
		String msg = g1.greet("스프링");
		System.out.println(msg);
		ctx.close();
	}
 
}
