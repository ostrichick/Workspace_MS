package studyJava.ex0715;

import java.util.List;
import java.util.ArrayList;

public class ListMain {

	public static void main(String[] args) {
		List<Integer> list = new ArrayList<Integer>();
		//list �÷��ǿ� ���Ҹ� �߰��� �� ����ϴ� �޼ҵ� - add()
		list.add(1);
		//list.add(1.0); 1.������ ���� (o) 2.���� �ȳ��� 3.�𸣰ڴ�.
		//add(index,value)
		list.add(2);
		list.add(0,3);
		list.add(3,5);
		
		// 3, 1, 2, 5
		//�÷��ǿ� Ư�� �ε��� ��Ҹ� �������� �޼ҵ� get(index)
		System.out.println(list.get(2));
		
		//set() Ư�� �ε��� ��Ҹ� ������ �� ����ϴ� �޼ҵ�
		list.set(1,6);
		
		System.out.println(list.get(1));
		
		//list �������̽� �ȿ� �ִ� arraylist ��ü�� ���� �� ���ϱ�
		int sum=0;
		//size() �÷��� ������ ���� ��ȯ
		for(int i=0;i<list.size();i++) {
			int value = list.get(i);
			sum += value;
		}
		System.out.println(sum);
		
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
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
