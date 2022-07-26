package studyJava.ex0708_copy;

//해당 소스파일 패키지 외에 존재하는 클래스를 사용하는 경우
//import 클래스를 해야 사용 할 수 있다.
import studyJava.ex0708.Shopping;
import studyJava.ex0708.Caculator;
//import studyJava.ex0708.Test;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Shopping shopping = new Shopping();
		shopping.orderNum = "";
		//shopping.orderId = ""; 
		//orderId 필드는 default 접근제한자 이기 때문에 패키지를 벗어나서는 사용할 수 없다.
		//Test test = new Test();
		
		//Caculator cal = new Caculator();
	}

}
