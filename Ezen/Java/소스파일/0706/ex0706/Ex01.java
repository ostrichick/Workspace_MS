package studyJava.ex0706;

public class Ex01 {

	public static void main(String[] args) {
		//이중 for문을 사용하여 3~7단까지 구구단을 출력하는 실행문을 작성하세요.
		out: for(int num1=3;num1<=7;num1++) {
			System.out.println("---------["+num1+"단]---------");
			for(int num2=1;num2<=9;num2++) {
				System.out.println(num1+"*"+num2+"="+(num1*num2));
				if(num2 == 5) {
					break out; 
					//가장 근접해 있는 반복문 하나를 종료하는 역할을 한다.
					//label을 사용하면 원하는 반복문 까지 종료 할 수 있다.
				}
			}
		}
		
		int sum=0; //sum 에는 1~10까지중 짝수의 합을 담을 변수  
		for(int i=1; i<=10; i++) {
			/*if(i%2==0) {
				sum += i;
			}*/
			if(i%2 != 0) {
				continue; 
				//반복문에서 continue문을 만나면 아래 실행문은 무시되고 다음 반복으로 진행된다.
			}
			sum+=i;
		}
	}

}
