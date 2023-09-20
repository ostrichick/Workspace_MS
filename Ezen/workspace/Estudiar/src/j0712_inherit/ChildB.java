package j0712_inherit;

//상속할 수 없는 클래스는 final 클래스 (부모가 될 수 없음)
public final class ChildB extends Parent2 {

  public final String field1 = "안녕하세요"; // 절대값을 가지는 필드 선언

  //	public ChildB(String arg) {
  //		super(arg);
  //	}

  public ChildB(String parentString) {
    // Parent2 클래스는 기본생성자가 없기 때문에
    // super() 생성자를 자동으로 호출할 수 없다
    //		System.out.println("");
    super(parentString); // 자식 ChildB가 생성될 때 문자열을 받아 부모생성자로 전달
    // super는 반드시 생성자 맨 윗줄에서 실행되어야함
    // 부모가 먼저 생성되기 때문
  }

  public void methodP1() {
    System.out.println("parent2 method override");
  }

  @Override
  public int methodOper(int num1, int num2) {
    return num1 - num2;
  }

  // 메소드 선언부가 달라서 매개변수가 다르므로 오버라이드가 아닌 오버로드
  //	@Override // 어노테이션은 컴파일러에게 해당 메소드가 오버라이딩하고 있으니
  // 부모 메소드 선언부와 일치하는지 더 강력한 컴파일을 하게 됨

  // final 키워드가 붙은 메소드는 자식클래스에서 재정의할수 없음
  public final int methodOper() {
    int num = 10;
    int num2 = 20;
    // super 키워드는 만들어지고있는 부모객체를 칭하기때문에
    // 자식 클래스내에서 재정이되기전 부모에 접근가능
    int result = super.methodOper(num, num2);
    System.out.println(result);
    return result;
  }

  public String g_field = "차일드 필드";

  @Override
  public void grandMethod() {
    System.out.println("차일드 메소드");
  }
}
