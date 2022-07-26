package studyJava.ex0715;

public class B {
	
	public <T> T method(T t) {
		return t;
	}
	/*
	public <T,K> T method2(K arg) {
		Object tempK = arg;
		String tempS = (String)tempK;
		int r = Integer.parseInt(tempS);
		
		return ;
		//return 
	}
	*/
}
