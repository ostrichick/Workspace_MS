package studyJava.ex0706;

public class Ex01 {

	public static void main(String[] args) {
		//���� for���� ����Ͽ� 3~7�ܱ��� �������� ����ϴ� ���๮�� �ۼ��ϼ���.
		out: for(int num1=3;num1<=7;num1++) {
			System.out.println("---------["+num1+"��]---------");
			for(int num2=1;num2<=9;num2++) {
				System.out.println(num1+"*"+num2+"="+(num1*num2));
				if(num2 == 5) {
					break out; 
					//���� ������ �ִ� �ݺ��� �ϳ��� �����ϴ� ������ �Ѵ�.
					//label�� ����ϸ� ���ϴ� �ݺ��� ���� ���� �� �� �ִ�.
				}
			}
		}
		
		int sum=0; //sum ���� 1~10������ ¦���� ���� ���� ����  
		for(int i=1; i<=10; i++) {
			/*if(i%2==0) {
				sum += i;
			}*/
			if(i%2 != 0) {
				continue; 
				//�ݺ������� continue���� ������ �Ʒ� ���๮�� ���õǰ� ���� �ݺ����� ����ȴ�.
			}
			sum+=i;
		}
	}

}
