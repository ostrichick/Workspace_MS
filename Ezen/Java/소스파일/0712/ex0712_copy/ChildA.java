package studyJava.ex0712_copy;

import studyJava.ex0712.Parent;

public class ChildA extends Parent {
	public String cA_field1="�ڽ� �ʵ�";
	
	public ChildA() {
		// �ڽ� �����ڿ��� �����Ҽ��� ������ �ݵ�� �θ� 
		// �����ڰ� ���� ȣ��ȴ�.
		super(); 
		System.out.println("�ڽ�A ����");
		System.out.println(p_feild2);
	}
}
