package studyJava.ex0718;

import java.util.*;

public class List2Main {

	public static void main(String[] args) {
		//contains(Object)
		//���ڷ� �ѱ�� ��ü�� �÷���(list)�ȿ� �����ϴ��� Ȯ���ϴ� �޼ҵ�
		List<String> sList = new ArrayList<>();
		sList.add(new String("��"));
		sList.add("��");
		sList.add("��");
		sList.add("��");
		
		String la = new String("��");
		
		sList.add(la);
		sList.add(la);
		
		//Q. �� sList �÷��ǿ� ���ǰ� �ִ� ���ڿ� �ּҴ� �� � �ϱ��?
		//1. 6�� 2.5�� 3.4�� 4.3�� 5.2�� 6.�𸥴�.
		
		// "��" , "��" , "��" , "��" , "��", "��"
		
		boolean containsYN = sList.contains("��");
		System.out.println("contains '��' "+containsYN);
		
		Student s1 = new Student("ȫ�浿",20,10,10,10);
		Student s2 = new Student("ȫ�浿",20,10,10,10);
		
		List<Student> stuList = new ArrayList<>();
		stuList.add(s1);
		
		//contains()�� �÷��ǿ� ��ü�� �����ϴ��� ���ϱ� ���Ͽ�
		//Object�� hashCode() �� equals()�� ����Ѵ�.
		//������ ���� ��ü �񱳸� ���ؼ��� Ŭ�������� �� �޼ҵ带 ������ �ؾ��Ѵ�.
		
		containsYN = stuList.contains(s2);
		System.out.println("contains 'ȫ�浿' ? " + containsYN);
		
		//isEmpty() - �÷����� ����ִ��� ���� Ȯ��
		List<Integer> iList = new ArrayList<>(); //{}
		
		boolean emptyYN =  iList.isEmpty();
		System.out.println("iList �� ����� �ֳ���?"+emptyYN);
		
		
		// "��" , "��" , "��" , "��", "��"
		System.out.println(sList.size());
		System.out.println(sList.get(0));
		
		sList.remove(0);
		
		System.out.println(sList.size());
		System.out.println(sList.get(0));
		
		System.out.println(sList.get(1));
		sList.remove("��");
		System.out.println(sList.get(1));
		
		//remove(Object) �� �����ϴ� ��ü�� ã�� ���Ͽ� 
		//���ڷ� �Ѿ�� ��ü�� ���� ��ü�� hashCode()�� equals()��
		//���Ѵ�.
		
		
		//clear()�� �÷��� ��ü�� ���Ҹ� ���� �����.
		sList.clear();
		System.out.println(sList.size());

	}

}
