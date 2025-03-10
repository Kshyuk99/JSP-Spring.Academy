package chap03.interTest;

public class Main1 {
	public static void main(String[] args) {
//		InterFace i2 = new InterFace() {
//			
//			@Override
//			public String method(int x, String s) {				
//				return x + ", " + s;
//			}
//		};
//		System.out.println(i2.method(100, "aaa"));
		
		InterFace i2 = (x,s) ->  x + ", " + s; 
		System.out.println(i2.method(100, "aaa"));
//		ImplInterF a1 = new ImplInterF();
//		a1.method();
		
//		InterFace i1 = new InterFace() {
//
//			@Override
//			public void method() {
//				System.out.println("method1");
//				
//			}
//			
//		};
//		InterFace i1 = () -> {   System.out.println("method1");  };
//		i1.method();
		
	}

}
