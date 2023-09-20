package studyJava.ex0711;

public class Main {

	public static void main(String[] args) {
		//int[] intArray = null; //�迭�� ���� Ÿ���̱� ������ null�� �ʱ�ȭ ����
		
		//�迭 ����� ������ �ʱ�ȭ -> {} �߰�ȣ �� ��� , �����ڷ� ������ ����
		int[] intArray = {10,20,30,40,50};
		
		//�迭 ���� ���� �� �� �����ϴ� ��� -> new �����ڸ� ����Ͽ� �迭�� �����Ͽ� ���� ����
		int[] intArray2 = null;
		intArray2 = new int[]{10,20,30,40,50};
		
		//�迭 ������ ���Ҵ� �𸣳� ���̸� ����Ͽ� �迭 �����ϴ� ���
		int[] intArray3 = new int[3];
		
		//�迭�� ���ҿ� �����ϴ� ���-> [index]
		int data = intArray3[0];
		System.out.println(data);
		
		//10,20,30 �� �����͸� ������ �ִ� int Ÿ�� �迭�� ���弼��
		int intArray4[] = {10,20,30};
		intArray4 = new int[] {10,20,30};
		//���̰� 5�� ���ڿ� �迭�� �������ּ���.
		String[] strArray = new String[5];
		System.out.println(strArray[0]);
		
		int sum=0;
		//�迭�� ���ҿ� �ݺ� �����ϴ� ����� �ݺ����� ����Ͽ� �迭�� ��� �ε����� �����Ѵ�.
		for(int i=0;i<intArray4.length;i++) {
			sum += intArray4[i];
		}
		System.out.println(sum);
		
		//�ڹٿ����� �迭�� ���̰� �������� �ش� �ε��� ������ ���������� ������ �� �ִ�.
		//��ġ�� �ε����� �����ϸ� ������ ����.
		//System.out.println(intArray4[3]);
		
		//�л� ������ �����ϼ���.
		// ȫ���� - 230��, ȫ����-190��, ȫ��� - 280��
		//�迭�� ����Ͽ� �л� ������ ��� ������ ����� ���� �̸��� ����ϼ���.
		Student s1 = new Student("ȫ����",230);
		Student s2 = new Student("ȫ����",190);
		Student s3 = new Student("ȫ���",280);
		
		//Student[] sA = {s1,s2,s3};

		//�迭�� ������ Ÿ���� ����Ÿ���� ��� ���ҿ��� �� �������� �ּҸ� �����ϰ� �ִ�.
		String[] strArray2 = {new String("��"),new String("��")};
		System.out.println(strArray2[0]==strArray2[1]);
		
		Student[] sA = new Student[] {s1,s2,s3};
		sA = new Student[3];
		sA[0] = s1;
		sA[1] = s2;
		sA[2] = s3;
		sA = new Student[] { new Student("ȫ����",230),new Student("ȫ����",190), new Student("ȫ���",280)};
		
		sum =0; //�� �л��� ���� ����
		double avg =0;  // ���л��� ���� ���
		
		int maxScore = 0; //�������
		String maxScoreName = ""; //����� �л���
		
		for(int i=0; i<sA.length;i++) {
			sum = sum+sA[i].getTotalScore();
			if(maxScore < sA[i].getTotalScore()) {
				maxScore = sA[i].getTotalScore();
				maxScoreName = sA[i].getName();
			}
		}
		avg = sum/sA.length;
		System.out.println("�л� ��� ���� : "+avg);
		System.out.println("�ְ���:"+maxScore);
		System.out.println("�ְ�����:"+maxScoreName);
		
		//���� ���� (�迭�� �ε����� �˾Ƽ� �ݺ��� �ϸ� ���Ҹ� �ڵ����� ���� ������ ����ش�)
		//�迭 sA�� ��� �ε����� �ݺ� �����ϸ� �� ���Ҵ� tempStudent�� ��ƶ�.
		//���� �����ϰ� �ִ� �ε��� ���� �ʿ� ���� ��� ���
		for(Student tempStudent : sA) {
			System.out.println("������ �̸� : "+tempStudent.getName());
			System.out.println("������ ���� : "+tempStudent.getTotalScore());
		}
		
		int[] intArray5 = {10,20,30,40,50};
		//�� �迭�� ����Ͽ� ���� for������ ������ �� ���� ����ϼ���.
		sum =0;
		for(int temp : intArray5) {
			sum += temp;
		}
		System.out.println(sum);
		
		//���� �����
		int[][] intArray6 = {{1,2,3},{4,5,6}};
		/*
		  1 2 3
		  4 5 6
		 */
		int result =intArray6[1][2];
		System.out.println(result);
		//2 ���� ��� �� �� �ֵ��� ������ �迭�� �˸°� �����ϼ���.
		System.out.println(intArray6[0][1]);
		
		Student[][] sArray = new Student[2][3];
		sArray[0][0] = new Student();
		sArray[0][1] = new Student();
		sArray[0][2] = new Student();
		//�迭������ ��ġ�� �ε����� �����͸� ����Ϸ� �Ҷ� ������ ����.
		sArray[0][3] = new Student();
		System.out.println(sArray[0][3].getName());
		
		intArray =new int[]{10,20,30,40,50};
		
		//�ڹٿ��� �迭�� ���̰� �����̱� ������ �迭�� ���̸� �����ϰ� ���� ���
		// �� ū �迭�� ����� �ϳ��� ��������� �Ѵ�.
		int[] copyArray = new int[10];
		for(int i=0; i<intArray.length;i++) {
			copyArray[i] = intArray[i];
		}
		for(int i = intArray.length;i<copyArray.length;i++) {
			int temp = i*10;
			copyArray[i] = temp;
		}
		
	}

}







