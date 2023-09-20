package studyJava.ex0706;

public class Example01 {

	public static void main(String[] args) {

		int mathScore=90;
		int engScore=75;
		int korScore =80;
		
		int totalScore = mathScore+engScore+korScore;
		System.out.println(totalScore);
		
		//결과를 실수 타입에 담는다 해도 피연산자 둘다 모두 int 이면 int 연산 후 실수로 형변환만 한다.
		//즉 결과값  뒤에 .0 만 붙는 형태가 된다.
		double avgScore = (double)totalScore/3.0;
		
		System.out.println(avgScore);
		
		System.out.println("----------------76page---------------");
		
		int gameScore = 150;
		
		int lastScore1 = gameScore++;
		System.out.println(lastScore1); //150 ,151
		
		int lastScore2 = gameScore--;	
		System.out.println(lastScore2);//151 , 150
		
		System.out.println("--------------79page----------------");
		
		int num = 5;
		int i=10;
		
		boolean value = ((num = num*5)>45)||((i=i-5)<10);
		
		System.out.println(i);
		
		//num1+=5 -> num1 = num1+5
		//num1 *= num2
		
		
		boolean isEven = (num%10 == 0)? true:false;
		
		//++,==,&&,+=
		
		System.out.println("------------98page--------------");
		
		int age =52;
		int charge;
		
		if(age<8) {
			System.out.println("취학 전 아동입니다.");
			
		}else if(age<14) {
			System.out.println("초등학생입니다.");
		}else if(age<20) {
			System.out.println("중,고등학생입니다.");
		}else if(age>60){
			System.out.println("경로 우대 입니다.");
		}else {
			System.out.println("일반인 입니다.");
		}
		
		
		System.out.println("----------100page-------------");
		
		int score=80;
		char grade;
		
		
		if(score>=90) {
			System.out.println("학점은 A입니다.");
		}else if(score>=80) {
			System.out.println("학점은 B입니다.");
		}else if(score>=70) {
			System.out.println("학점은 C입니다.");
		}else if(score>=60) {
			System.out.println("학점은 D입니다.");
		}else {
			System.out.println("학점은 F입니다.");
		}
		
		System.out.println("-----------106page-------------");
		int num3=3;
		switch(num3) {
		case 5 :
			System.out.println("헬스클럽입니다.");
			break;
		case 4 :
			System.out.println("치과입니다.");
			break;
		case 3 :
			System.out.println("피부과클럽입니다.");
			break;
		case 2 :
			System.out.println("정형외과입니다.");
			break;
		case 1 :
			System.out.println("약국입니다.");
			break;
		default:
				
		}
		
		
		
		
	}

}
