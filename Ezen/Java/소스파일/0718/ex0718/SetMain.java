package studyJava.ex0718;

import java.util.*;

public class SetMain {

	public static void main(String[] args) {
		Set<String> set = new HashSet<>();
		set.add(null);
		set.add(null);
		System.out.println(set.size());
		
		Set<A> aSet = new HashSet<>();
		A a1 = new A();
		a1.field1 = "a";
		A a2 = new A();
		a2.field1 = "a";
		
		aSet.add(a1);
		aSet.add(a2);
		aSet.add(a1);
		
		//hashCode() �� equals() �� ����Ͽ� ���� ��ü�� Ȯ��������
		//��Ȯ�ϰ� ���������� ���� ��ü�� ��쿡�� set�� ���� �� ����.
		System.out.println(aSet.size()); //1.3 2.2 3.1 4.0
		
		//set�� �������� ������ ���� �� �� ���� ������ Ư�� �����͸� 
		//�����ų� �����ϴ� ���� �Ұ��� �ϴ�.
		
		//contains() set�ȿ� ���ϰ�ü�� �����ϴ��� ���� Ȯ��
		//imEmpty() set���� ����� �ִ��� Ȯ��
		//size() set �ȿ� ���� ���� ��ȯ
		//clear() set ���� ���� ���
		//remove(object) Ư�� ���� set���� ��ü
		
		Set<String> sSet = new HashSet<>();
		
		sSet.add("��");
		sSet.add("��");
		sSet.add("��");
		sSet.add("��");
		sSet.add("��");
		
		//set �÷��� ���ҿ� ��� �����ϴ� ���
		Iterator<String> sIter = sSet.iterator();
		
		while(sIter.hasNext()) {
			String temp = sIter.next();
			System.out.println(temp);
		}
		
		
		sSet.clear();
		
		sSet.add("java");
		sSet.add("javascript");
		sSet.add("html");
		sSet.add("oracle");
		sSet.add("actionscript");
		sSet.add("spring");
		
		//set�ȿ� �ִ� ������ "ri" ���ڿ��� ������ �ִ� �����͸� ���� ����ϼ���. 
		Iterator<String> sIter2 = sSet.iterator();
		
		while(sIter2.hasNext()) {
			String temp = sIter2.next();
			if(temp.indexOf("ri")>-1) {
				System.out.println(temp);
			}
		}
		//set �������̽� ������ ����ϸ� ���ҵ��� toString() ȣ�� �����
		//�Ϸ��� ���ڿ��� ����� ����Ѵ�.
		System.out.println(sSet);
		System.out.println(aSet);
		
	}

}


