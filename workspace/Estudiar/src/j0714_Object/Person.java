package j0714_Object;

public class Person {

  public String personNum;
  public String name;
  public int age;
  public String addr;

  public Person(String personNum, String name) {
    super();
    this.personNum = personNum;
    this.name = name;
  }

  @Override
  public boolean equals(Object obj) {
    if (obj instanceof Person) {
      Person p = (Person) obj;
      return this.personNum.equals(p.personNum);
    } else System.out.print("연산불가 ");
    return false;
  }

  @Override
  public String toString() {
    return (
      "Person [personNum=" +
      personNum +
      ", name=" +
      name +
      ", age=" +
      age +
      ", addr=" +
      addr +
      "]"
    );
  }

  @Override
  public int hashCode() {
    // 논리적으로 데이터가 같으면 똑같은 hashCode가 나오도록 재정의
    // 그래야 동등객체를 비교할 수 있음
    // hashCode()는 객체의 데이터가 논리적으로 같다면
    // 같은 값을 반환할 수 있게끔 재정의
    return personNum.hashCode();
  }
  //
  //

}

class Student extends Person {

  public Student(String personNum, String name) {
    super(personNum, name);
  }

  @Override
  public String toString() {
    return "[name = " + name + "] [personNum = " + personNum + "]";
  }

  @Override
  public boolean equals(Object obj) {
    if (obj instanceof Student) {
      Student std = (Student) obj;
      if (this.personNum == std.personNum) return true; else return false;
    }
    return false;
  }

  @Override
  public int hashCode() {
    return personNum.hashCode();
  }
}
