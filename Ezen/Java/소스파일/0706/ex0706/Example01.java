package studyJava.ex0706;

public class Example01 {

	public static void main(String[] args) {

		int mathScore=90;
		int engScore=75;
		int korScore =80;
		
		int totalScore = mathScore+engScore+korScore;
		System.out.println(totalScore);
		
		//����� �Ǽ� Ÿ�Կ� ��´� �ص� �ǿ����� �Ѵ� ��� int �̸� int ���� �� �Ǽ��� ����ȯ�� �Ѵ�.
		//�� �����  �ڿ� .0 �� �ٴ� ���°� �ȴ�.
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
			System.out.println("���� �� �Ƶ��Դϴ�.");
			
		}else if(age<14) {
			System.out.println("�ʵ��л��Դϴ�.");
		}else if(age<20) {
			System.out.println("��,����л��Դϴ�.");
		}else if(age>60){
			System.out.println("��� ��� �Դϴ�.");
		}else {
			System.out.println("�Ϲ��� �Դϴ�.");
		}
		
		
		System.out.println("----------100page-------------");
		
		int score=80;
		char grade;
		
		
		if(score>=90) {
			System.out.println("������ A�Դϴ�.");
		}else if(score>=80) {
			System.out.println("������ B�Դϴ�.");
		}else if(score>=70) {
			System.out.println("������ C�Դϴ�.");
		}else if(score>=60) {
			System.out.println("������ D�Դϴ�.");
		}else {
			System.out.println("������ F�Դϴ�.");
		}
		
		System.out.println("-----------106page-------------");
		int num3=3;
		switch(num3) {
		case 5 :
			System.out.println("�ｺŬ���Դϴ�.");
			break;
		case 4 :
			System.out.println("ġ���Դϴ�.");
			break;
		case 3 :
			System.out.println("�Ǻΰ�Ŭ���Դϴ�.");
			break;
		case 2 :
			System.out.println("�����ܰ��Դϴ�.");
			break;
		case 1 :
			System.out.println("�౹�Դϴ�.");
			break;
		default:
				
		}
		
		
		
		
	}

}
