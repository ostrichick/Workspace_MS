package studyJava.ex0714;

public class Person {
	public String personNum;
	public String name;
	public int age;
	public String addr;
	
	public Person(String personNum, String name) {
		this.personNum = personNum;
		this.name = name;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Person) {
			Person p = (Person)obj;
			return this.personNum.equals(p.personNum);
		}else {
			return false;
		}
	}

	@Override
	public String toString() {
		return "Person [personNum=" + personNum + ", name=" + name + ", age=" + age + ", addr=" + addr + "]";
	}
	
	/*
	 * @Override public String toString() {
	 * 
	 * return "personNum:"+personNum+",name:"+name+",age:"+age+",addr:"+addr; }
	 */
	
	@Override
	public int hashCode() {
		//�������� �����Ͱ� ������ �Ȱ��� hashCode�� ���ü� �ֵ��� ������ �ؾ��Ѵ�.
		//�׷��� ���� ���ü�� �� �� �� �ִ�.
		//hashCode()������ ��ü�� �����Ͱ� �������� ���ٸ� ���� �ڵ尪�� ��ȯ �� ��
		//�ֵ��� �����ؾ��Ѵ�.
		return personNum.hashCode();
	}
}





