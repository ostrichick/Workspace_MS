package j0713_interface;

public class Main {

  public static void main(String[] args) {
    //추상 클래스
    //		AbstractParent aParent = new AbstractParent();
    //		aParent.method1();

    //		Child1 c1 = new Child1();
    //		c1.method1();
    //		c1.method2();

    Child2 c2 = new Child2();
    c2.method1();
    c2.method2();
    //		c2.super.method2();

    // 인터페이스
    // 인터페이스에 구현 객체를 대입하는 방법
    // 객체 생성후 인터페이스 타입변수에 구현 객체를 담는다
    TV tv = new TV();
    SampleInterface si = tv;
    // 인터페이스를 통하여 구현객체의 메소드를 호출
    System.out.println(si.addVOLUME(5));
    System.out.println(si.minusVOLUME(3));
    si.turnOff();
    si.turnOn();
    si.mute();

    tv.turnOff(); // tv는 여전히독립적인 개체로 작동함

    // 익명의 구현 객체 - 구현 클래스 없이 한번만 인터페이스를 사용하여 생성되고 사라지는 객체
    si =
      new SampleInterface() {
        @Override
        public int addVOLUME(int volume) {
          return 30;
        }

        @Override
        public int minusVOLUME(int volume) {
          return 0;
        }

        @Override
        public void turnOn() {
          System.out.println("익명객체 켜기");
        }

        @Override
        public void turnOff() {
          System.out.println("익명객체 끄기");
        }
      };

    si.addVOLUME(8);
    si.turnOff();

    // 디폴트 메소드 사용할때는 구현객체가 담긴 인터페이스타입변수 사용
    // 디폴트메소드는 구현 객체의 공통기능이라서 객체를 사용하여 호출 가능
    tv.mute();
    si.mute();

    //		tv.changeBattery();
    SampleInterface.changeBattery();

    // 디폴트 메소드는 구현 클래스에서 재정의 가능? ㅇㅇ
    // 구현 클래스에서 디폴트 메소드를 재정의하면 인터페이스의 메소드는 숨김처리

    ABImple abi = new ABImple();
    // 구현객체는 구현한 모든 인터페이스 타입에 각각 대입될 수 있다
    AInterface aInterface = abi;
    Binterface binterface = abi;

    // 다중 인터페이스 국현 객체는 대입된 인터페이스의 범위까지만 사용가능
    aInterface.methodA();
    //		ainterface.methodB();
    //		binterface.methodA();
    binterface.methodB();

    ABImple2 abi2 = new ABImple2();
    // abi abi2
    // 인터페이스의 구현 객체가 인터페이스 타입변수에 자동형변환되어 담김
    // 위 논리를 사용 인터페이스를 이용한 다형성 구현
    AInterface aInterface2 = abi2;
    // Binterface binterface2 = abi2;
    aInterface2 = abi;
    aInterface2.methodA();

    aInterface2 = abi2;
    aInterface2.methodA();

    Person person = new Person();
    person.a = abi; // a필드에 대입될수있는 객체수 2개 : AInterface 구현 객체수
    person.printA();
    person.a = abi2;
    person.printA();
    // 객체의 필드로 인터페이스 타입을 둘 경우 어떤 구현 객체가 대입되느냐에 따라 다른 결과가 도출(다형성)
    person.printB(abi);
    person.printB(abi2);
    // 객체의 메소드 매개변수 타입으로 인터페이스가 있을 경우 어떤 구현객체를 대입하느냐에따라 다른결과 (다형성)

    // 인터페이스 타입에 구현객체가 대입되는것은 자동형변환, 업캐스팅
    Binterface bi2 = abi; // ABImple
    // 인터페이스에 담긴 구현객체를 구현클래스 변수에 대입, 강제형변환
    // 인터페이스 안에 어떤 구현담긴지 확실치 않으므로
    // instanceof로 타입 체크를 하여 다운캐스팅
    if (bi2 instanceof ABImple) {
      ABImple abi_copy = (ABImple) bi2;
      abi_copy.getClass();
    }
    //
    //
  }
}
