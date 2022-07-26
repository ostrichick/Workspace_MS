package j0712_inherit;

public class Main {

  public static void main(String[] args) {
    // 부모도 독립적인 개체임
    Parent parent = new Parent();
    System.out.println(parent.p_field1);
    System.out.println(parent.p_field2);
    System.out.println(parent.p_field3);
    //		System.out.println(parent.p_field4); // private 접근제한자 때문에 접근 불가

    ChildA childA = new ChildA();
    // 자식은 부모가 되는 멤버를 상속받기 때문에 선언하기 않아도 부모의 멤버를 사용할 수 있다
    System.out.println(childA.p_field1);
    System.out.println(childA.p_field2);
    System.out.println(childA.p_field3);
    //		System.out.println(childA.p_field4);

    Parent2 p2 = new Parent2("");
    p2.methodP1();
    ChildB cB = new ChildB("");
    cB.methodP1();

    System.out.println(p2.methodOper(5, 3));
    System.out.println(cB.methodOper(5, 3));

    Tire tire = new Tire();
    Car car = new Car();
    car.tire = tire;
    car.tireRun();

    HangukTire hangukTire = new HangukTire();
    car.tire = hangukTire; // 부모에는 모든 자식 객체가 자동 형변환된다
    car.tireRun();
    // 부모에는 모든 자식 객체가 자동 형변환되며 대입되기 때문에
    // 어떤 자식 객체가 대입되었느냐에 따라 똑같은 부모 메소드도 다른 결과 도출
    // 다형성을 통해 객체를 부품화하며 유지보수를 쉽게 함

    GumhoTire gumhoTire = new GumhoTire();

    ChildB cb2 = new ChildB("");
    // 자식의 자식 객체 생성시 동시에 객체 3개 생성

    GrandMom gm = cb2;

    System.out.println(gm.g_field); // 할머니 필드
    gm.grandMethod(); // 차일드 메소드

    Car.tireRun(gumhoTire);
    Car.tireRun(new HangukTire());

    // 업캐스팅: 자식 객체를 부모타입 변수에 대입. 자동형변환
    // 다운캐스팅: 상위 부모를 자식타입 변수에 대입하는 것. 강제형변환
    // 부모 객체는 해당타입 자식을 가지고있지 않을수도 있기때문
    cb2 = (ChildB) gm;

    cb2.methodOper();

    Parent2 p22 = new Parent2("");
    Parent3 p33 = new Parent3();
    p22.getClass();

    gm = p33; // 모든 자식은 부모객체를 포함하기대문에 부모에 자동형변환(업캐스팅)
    Parent3 p33_down = (Parent3) gm; // 부모 객체는 해당 자식객체를 포함하지않을 수 있기 때문에 강제형변환(다운캐스팅)
    p33_down.getClass();
    // 다운캐스팅은 부모의 자식타입으로 모두 강제형변환이 되기때문에
    // 이때 타겟의 객체안에 일치하지 않는 자식으로도 형변환 가능

    // instanceof 연산자는 객체가 어떤 클래스타입으로 생성되었는지 확인하는 연산자
    // 객체 instanceof 타입의 결과가 true이면 해당타입으로 만들어진 객체
    if (gm instanceof Parent2) {
      Parent2 p22_down = (Parent2) gm;
      System.out.println(p22_down + "instanceof");
    } else {
      System.out.println("noinstance");
    }
    //
    //
    //
    //
  }
}
