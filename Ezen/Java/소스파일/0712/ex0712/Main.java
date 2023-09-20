package studyJava.ex0712;

public class Main {

	public static void main(String[] args) {
		
		//�θ� ���������� ��ü�� �� �� �ִ�.
		Parent parent = new Parent();
		
		System.out.println(parent.p_feild1);
		System.out.println(parent.p_feild2);
		System.out.println(parent.p_feild3);
		//p_feild4 �� ���������ڰ� private�̱� ������ �ش� Ŭ���������� ����� �� ����
		//System.out.println(parent.p_feild4);
		
		ChildA childA = new ChildA();
		//�ڽ��� �θ� ���� ����� ��� �ޱ� ������ �������� �ʾƵ� �θ��� ����� ����� �� �ִ�.
		System.out.println(childA.p_feild1);
		System.out.println(childA.p_feild2);
		System.out.println(childA.p_feild3);
		//���������ڰ� private �̱� ������ ����� �� ����.
		//System.out.println(childA.p_feild4);
		
		
		Parent2 p2 = new Parent2("");
		p2.methodP1();
		
		ChildB cb = new ChildB("");
		cb.methodP1();
		
		
		Tire tire = new Tire();
		Car car = new Car();
		
		car.tire =tire;
		car.tireRun(); //1.Ÿ�̾ 2.�ѱ�Ÿ�̾ 3.��ȣŸ�̾
		
		HankukTire han = new HankukTire();
		car.tire = han; //�θ𿡴� ��� �ڽ� ��ü�� �ڵ� ����ȯ �ȴ�.
		car.tireRun(); //1.Ÿ�̾ 2.�ѱ�Ÿ�̾ 3.��ȣŸ�̾
		
		//�θ𿡴� ��� �ڽ� ��ü�� �ڵ� ����ȯ �Ǿ� ���ԵǱ� ������
		//� �ڽ� ��ü�� ���� �Ǿ����Ŀ� ���� �Ȱ��� �θ� �޼ҵ忩�� �ٸ� ����� �����Ѵ�.
		//�̰� �ٷ� �ڹ��� �������̸� ��ü�� ��ǰȭ �Ͽ� ���������� �����ϰ� �ϴ� ���̴�.
		
		ChildB cb2 = new ChildB("");
		//ChildB ��ü�� ���� �� �����Ǵ� ��ü�� ���� ���纸����.
		//1.3�� 2.2�� 3.1��
		
		GrandMom gm = cb2; //1.������ ����. 2.������ �ȳ���. 3.�𸥴�.
		//�ļ��� ���� Ŭ���� ������ ���� �Ǿ� �ִ� ��� ���Ե� �ļ��� �������� �޼ҵ尡 ����ȴ�.
		gm.grandMethod();

		HankukTire han2 = new HankukTire();
		Car.tireRun(han2);
		Car.tireRun(new KumhoTire());
		
		//�� ĳ���� : �ڽ� ��ü�� �θ� Ÿ�� ������ �����ϴ� ���� �ǹ���. (�ڵ�Ÿ�Ժ�ȯ)
		//�ٿ�ĳ���� : ���� �θ� �ڽ� Ÿ�� ������ �����ϴ� ���� �ǹ���. (����Ÿ�Ժ�ȯ)
		//          �θ� ��ü�� �ش� Ÿ�� �ڽ��� ������ ���� �������� �ֱ� �����̴�.
		cb2 = (ChildB)gm;
		
		cb2.methodOper();
		
		Parent2 p22 =  new Parent2("");
		Parent3 p33 = new Parent3();
		
		gm = p33; //��� �ڽ��� �θ� ��ü�� �����ϱ� ������ �θ� �ڵ�����ȯ(��ĳ����)
		Parent3 p33_down = (Parent3)gm; //�θ� ��ü�� �ش� �ڽ� ��ü�� �������� ���� �� �ֱ� ������ ��������ȯ(�ٿ�ĳ����) 
		
		//instanceof �����ڴ� ��ü�� � Ŭ���� Ÿ������ ���� �Ǿ����� Ȯ���ϴ� �������̴�.
		// ��ü instanceof Ÿ�� �� ����� true �̸� �ش� Ÿ������ ������� ��ü�̴�.
		if(gm instanceof Parent2) {
			//�ٿ�ĳ������ �θ��� �ڽ� Ÿ������ ��� ���� ����ȯ�� �Ǳ� ������
			//�̶� Ÿ�� ��ü�ȿ� ��ġ���� �ʴ� �ڽ����ε� ����ȯ�� �����ϴ�.
			Parent2 p22_down = (Parent2)gm;
		}
	}

}







