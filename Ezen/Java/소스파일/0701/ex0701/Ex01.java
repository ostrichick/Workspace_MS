package studyJava.ex0701;

public class Ex01 {

	public static void main(String[] args) {
		int a; //���� ���� (���� �� �ʱ�ȭ ���� ������ ������ ���� �Ҵ�Ǿ� �ִ�.)
		
		//System.out.println(a); //�ڹٿ��� ������ �����Ͱ� �Ҵ�Ǳ� ������ ���� �� ����.
		
		a = 10; //���� ���� �� ������ �Ҵ�
		
		System.out.println(a); 
		
		int b = 10; // ���� ����� ���ÿ� ������ �Ҵ� (���� �ʱ�ȭ)
		
		
		if(a>=10) {
			int c = 20;
			System.out.println(a);
			System.out.println(c);
		}
		
		System.out.println(a);
		//System.out.println(c); ������ �ڽ��� ����� ���� �ȿ����� ��� �� �� �ִ�.
		
		// byte b1 = -129; byte Ÿ���� 7bit�� ����Ͽ� ���� ǥ���ϹǷ� -128~127 �� ������ ���� �� �ִ�.
		
		char c1 = 1; //�����ڵ��� 1 �ڵ忡 �ش��ϴ� ���ڸ� ��ƶ�.
		char c2 = '��'; // �����ڿ� �ش��ϴ� �����ڵ尪�� ��ƶ�
		//char Ÿ���� ��½� �ش� �����ڵ��� ���ڷ� ��ȯ�Ͽ� ����Ѵ�.
		System.out.println(c1);
		System.out.println(c2);
		
		int c3 = c2; //char Ÿ�� ���ڸ� ����Ÿ�Կ� �Ҵ��ϸ� �ش� �����ڵ� ���� �� �� �ִ�.
		//���� ������Ÿ�Կ� ��� ������ ū ������ Ÿ�� ������ ��� ���� �ڵ� ����ȯ�̶�� �Ѵ�.
		System.out.println(c3);
		
		long long1 = 2147483648L; 
		//���ͷ��� ������ Ÿ���� �����ϸ� �⺻ int Ÿ���̹Ƿ� �� �̻��� �����͸� 
		//ǥ�� �� ��� l�Ǵ� L�� ����ȯ �Ͽ��� �Ѵ�.
		
		float f1 = 3.14f;
		//���ͷ� �Ǽ��� double Ÿ���̹Ƿ� �� ���� ������ Ÿ���� float�� ���� ��� f �Ǵ� F
		//�� �̿��Ͽ� ����ȯ �Ͽ��� �Ѵ�.
		
		boolean boo = true;
		
		
		final int num = 100;
		
		System.out.println(num);
		//num = 200; final Ű����� ����� ������ �� ����ϹǷ� 
		//�ش� ������ ���� �ʱ�ȭ �Ǹ� ���� �� �� ����.
		boo = false;
		a = 20;
		
		
		
		byte byteNum01 = -100;
		
		short shortNum01 = byteNum01;
		
		System.out.println(byteNum01);
		System.out.println(shortNum01);
		
		float floatNum01 = byteNum01;
		System.out.println(floatNum01);
		//�ڵ� ����ȯ ���� ������ Ÿ���� ū ������ Ÿ�Կ� �ƹ��� ��� ���� ���ϴ� ���� ���Ѵ�.
		//�ڵ� ����ȯ �� ���� �޸𸮿� ���ؼ��� 0���� ä���.
		//(�̶� ��ȣ�δ� ���� ������ Ÿ�� �޸𸮸� �����Ѵ�.)
		
		
		byte byteNum02 = 10;
		byte byteNum03 = 127;
		
		//���� ���꿡�� �ٸ� ������ Ÿ�Գ��� ������ ����� int �̹Ƿ� int�� �ڵ� ����ȯ �ȴ�.
		int result = byteNum02+byteNum03;
		
		int intNum02 = 127;
		byteNum03 = (byte)intNum02; 
		
		//ūŸ���� �����͸� ���� Ÿ������ ���� ��� ���� ����ȯ�� �ؾ��ϴµ�
		//�̶� ���� ������ Ÿ������ ���� �� ���� �޸𸮴� ������ ����(�ս�)�� ���� �� �ִ�.
		int intNum03 = 128;
		byteNum03 = (byte)intNum03;
		System.out.println(byteNum03);
		
	}

}






