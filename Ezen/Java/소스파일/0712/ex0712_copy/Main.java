package studyJava.ex0712_copy;

import studyJava.ex0712.Parent;

public class Main {

	public static void main(String[] args) {
		
		//�θ� ���������� ��ü�� �� �� �ִ�.
		Parent parent = new Parent();
		
		System.out.println(parent.p_feild1);
		//System.out.println(parent.p_feild2);
		//p_feild3�� default �����������̱� ������ ��Ű���� ����� ����� �� ����.
		//System.out.println(parent.p_feild3);
		//p_feild4 �� ���������ڰ� private�̱� ������ �ش� Ŭ���������� ����� �� ����
		//System.out.println(parent.p_feild4);
		
		ChildA childA = new ChildA();
		//�ڽ��� �θ� ���� ����� ��� �ޱ� ������ �������� �ʾƵ� �θ��� ����� ����� �� �ִ�.
		System.out.println(childA.p_feild1);
		//protected ���������ڴ� ���� ��Ű���� ��ӹ��� �ڽ� Ŭ���� �������� ���� �� �� �ִ�.
		//System.out.println(childA.p_feild2);
		//System.out.println(childA.p_feild3);
		//���������ڰ� private �̱� ������ ����� �� ����.
		//System.out.println(childA.p_feild4);
		
		
	}
	
	
	
	

}
