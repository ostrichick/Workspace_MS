package studyJava.ex0706;

public class Ex02 {

	public static void main(String[] args) {

		int a = 10;
		int b = 10;
		if(a==b) {
			System.out.println("�μ��� �����ϴ�.");
		}
		
		String str1 = new String("��");
		String str2 = new String("��");
		if(str1 == str2) {
			System.out.println("�� ���ڰ� �����ϴ�.");
		}else {
			System.out.println("�� ���ڴ� �ٸ��ϴ�.");
		}
		str1 = null; // null�� ����Ÿ�� ������ ���� ���̴�.
		//System.out.println("str1����::"+str1.length()); 
		//���� ����Ÿ�� ������ null�ε� ��ü�� ����Ϸ� �Ѵٸ� nullpointerxception�� �߻��Ѵ�.
		
	}

}







