package studyJava.ex0718;

import java.util.*;

public class ListMain {

	public static void main(String[] args) {
		
		/*
			�л� ��ü�� 5�� ����ϴ�.
			�л��� �̸�, ����, ��������, ��������, �������� �ʵ带 ������ �ֽ��ϴ�.
			����)
			1. ȫ���� - 20 - 98 - 87 - 79
			2. ȫ���� - 21 - 80 - 97 - 86
			3. ȫ��� - 20 - 77 - 79 - 88
			4. ȫ��� - 20 - 88 - 79 - 80
			5. ȫ��� - 21 - 75 - 90 - 83
			
			List �������̽��� ArrayList ����Ŭ������ ����Ͽ� �� ������ �����ϴ�.
			1.�� ����, ����, ���� ���� ������� ���Ͻÿ�
			2.�� ����, ����, ���� ������ ��� ������ ���Ͻÿ�.
			3.��� ������ ��� ������ ���ϼ���. 
		
		*/
		
		Student s1 = new Student("ȫ����", 20, 98, 87, 79);
		Student s2 = new Student("ȫ����", 21, 80, 97, 86);
		Student s3 = new Student("ȫ���", 20, 77, 79, 88);
		Student s4 = new Student("ȫ���", 20, 88, 79, 80);
		Student s5 = new Student("ȫ���", 21, 75, 90, 83);
		
		//sArray �������̽��� ���ҷ� ��� �� �� ���� ����?
		//1.String 2.Student(o) 3.Integer 4.Long 5.�𸥴�.
		List<Student> sArray = new ArrayList();
		sArray.add(s1);
		sArray.add(s2);
		sArray.add(s3);
		sArray.add(s4);
		sArray.add(s5);
		
		int maxEngScore=0; //�׻� ������ �ְ����� ��� ����
		int maxMathScore=0;
		int maxKorScore=0;
		
		Student maxEngStudent = null; //�׻� ������ �ְ����� �л��� ��� ����
		Student maxMathStudent = null;
		Student maxKorStudent = null;
		
		int totalEngScore=0;
		int totalMathScore=0;
		int totalKorScore=0;
		
		for(int i=0; i<sArray.size();i++) {
			Student currentStudent = sArray.get(i);
			totalEngScore += currentStudent.getEngScore(); //totalEngScore =totalEngScore+? 
			totalMathScore += currentStudent.getMathScore();
			totalKorScore += currentStudent.getKorScore();
			
			//���� �ְ����� �������
			int engScore = currentStudent.getEngScore();
			if(maxEngScore<engScore) {
				maxEngScore = engScore;
				maxEngStudent = currentStudent;
			}
			//���� �ְ����� �������
			int mathScore = currentStudent.getMathScore();
			if(maxMathScore<mathScore) {
				maxMathScore = mathScore;
				maxMathStudent = currentStudent;
			}
			//���� �ְ����� �������
			int korScore = currentStudent.getKorScore();
			if(maxKorScore<korScore) {
				maxKorScore = korScore;
				maxKorStudent = currentStudent;
			}
		}
		System.out.println("����:"+maxEngScore);
		System.out.println("����:"+maxMathScore);
		System.out.println("����:"+maxKorScore);
		
		System.out.println("���� ���:"+((double)totalEngScore/sArray.size()));
		System.out.println("���� ���:"+((double)totalMathScore/sArray.size()));
		System.out.println("���� ���:"+((double)totalKorScore/sArray.size()));
		
		System.out.println("�� ���:"+(totalEngScore+totalMathScore+totalKorScore)/(double)sArray.size());
		
		
	}

}
