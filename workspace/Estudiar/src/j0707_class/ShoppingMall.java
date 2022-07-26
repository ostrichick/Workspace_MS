package j0707_class;

public class ShoppingMall {

  public static void main(String[] args) {
    ShoppingMall order0001 = new ShoppingMall(
      201803120001l,
      "abc123",
      "2018년 3월 12일",
      "홍길순",
      "PD0345-12",
      "서울시 영등포구 여의도동 20번지"
    );
    System.out.println(order0001);
    System.out.println(order0001.orderID);
    System.out.println(order0001.customerID);
    System.out.println(order0001.orderDate);
    System.out.println(order0001.customerName);
    System.out.println(order0001.productID);
  }

  public long orderID;
  private String customerID;
  protected String orderDate;
  String customerName;
  public String productID;
  public String customerAddr;

  public ShoppingMall() {}

  //생성자의 접근 제한자가 default인 경우에는 같은 패키지내에서만 해당클래스의 객체를 만들 수 있다

  //생성자의 접근제한자가 public이면 모든 패키지에서 생성자를 사용하여 객체를 만들 수 있다
  public ShoppingMall(
    long orderID,
    String customerID,
    String orderDate,
    String customerName,
    String productID,
    String customerAddr
  ) {
    this.orderID = orderID;
    this.customerID = customerID;
    this.orderDate = orderDate;
    this.customerName = customerName;
    this.productID = productID;
    this.customerAddr = customerAddr;
  }

  //접근제한자가 protected인 경우에는 자식 클래스, 같은 패키지 내에서 생성자 호출 가능
  protected ShoppingMall(String a) {}

  //접근제한자가 private인 경우에는 해당클래스 내에서만 생성자 호출 가능
  // private ShoppingMall(double a) {}

  //public 키워드 메소드는 모든 패키지에서 호출 가능
  public void method() {
    System.out.println("");
  }

  //default 메소드는 자기 패키지 안에서 호출 가능
  void method(int a) {
    System.out.println("");
  }
}

class test {

  public int field = 1;
}
