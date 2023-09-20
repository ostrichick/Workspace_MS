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
		//논리적으로 데이터가 같으면 똑같은 hashCode가 나올수 있도록 재정의 해야한다.
		//그래야 논리적 동등객체를 비교 할 수 있다.
		//hashCode()에서는 객체의 데이터가 논리적으로 같다면 같은 코드값을 반환 할 수
		//있도록 수정해야한다.
		return personNum.hashCode();
	}
}





