package j0714_Object;

public class Main {

  public static void main(String[] args) {
    A a = new A();
    a.getClass();
    // Object 클래스는 자바의 최상위 클래스, java.lang 패키지 안에 존재
    // 기본패키지기때문에 import 생략 가능
    Object object = new Object();
    object.getClass();

    String str1 = new String("가");
    String str2 = new String("가");
    str2.hashCode();

    // 문자열 값 비교를 위해 equals 메소드 사용
    // equals 메소드는 Object 클래스의 메소드, String에서 재정의하여 문자열 값의 비교
    System.out.println(str1 == "가");
    System.out.println(str1.equals("가"));

    A a2 = new A();
    System.out.println(a == a2);
    if (a.equals(a2)) {
      System.out.println("같음");
    } else {
      System.out.println("다름");
    }
    a2 = a;
    // 원래 Object가 가진 equals 메소드는 두 객체간의 주소값을 비교, boolean값 반환
    System.out.println(a == a2);
    if (a.equals(a2)) {
      System.out.println("같음");
    } else {
      System.out.println("다름");
    }

    Person person1 = new Person("111111-1111111", "홍길동");
    Person person2 = new Person("111111-1111111", "홍길동");

    if (person1.equals(person2)) {
      System.out.println("같은 사람" + "1");
    } else {
      System.out.println("다른 사람" + "1");
    }

    // System.out.println(person1.equals(new String("안녕하세여")));
    System.out.println(person1.equals(person2));

    // toString()
    // 객체의 주소정보를 문자열로 반환
    // 하지만 주소정보는 쓸모가없으므로
    // 엔티티 클래스에서 재정의해서 필드 내용을 볼 수 있게 함
    // 개발 중 오류 찾는 디버깅용으로 사용
    System.out.println(person1.toString());
    System.out.println(person2); // 객체의 변수명만 사용하면 자동으로 .toString()의 결과를 보여줌

    // Object 클래스가 정의한 hashCode()는 객체의 주소정보를 정수로 반환
    System.out.println(person2.hashCode());

    String str3 = new String("311111-1111111");
    String str4 = new String("311111-1111111");
    str3.length();
    str4.length();

    //		System.out.println(str3.hashCode());
    //		System.out.println(str4.hashCode());
    System.out.println(person1.hashCode());
    System.out.println(person2.hashCode());

    // String 클래스
    // 문자열 객체를 만들때는 리터럴 문자열을 사용할 수 있지만
    // 이진수가 담긴 바이트 배열을 사용해서도 만들 수 있다.

    byte[] bytes = { 72, 101, 108, 108, 111, 13, 10 };
    String str5 = new String(bytes);
    System.out.print(str5);
    System.out.print(str5);

    // charAt() 해당 문자열 인덱스에 해당하는 문자 하나를 반환
    char c1 = str5.charAt(2);
    System.out.println(c1);

    String str6 = new String("홍길동");
    // 문자열 값의 비교는 ==가 아니라 equals()를 사용
    System.out.println(str6 == "홍길동");
    System.out.println(str6.equals("홍길동"));

    // getBytes()는 문자열에 대한 byte배열을 얻어옴
    // 한글같은 문자는 2byte 이상을 사용함
    byte[] bytes_hong = str6.getBytes();
    for (byte b : bytes_hong) {
      System.out.println(b);
    }
    System.out.println("ㅇㅅㅇ");
    String str7 = "안녕하세여. 자바 배우는 중이자바.";

    int result = str7.indexOf("우");
    System.out.println(result);

    result = 0;
    String[] strArray = {
      "java",
      "html",
      "css",
      "javaprogramming",
      "oracle",
      "gogimeokja",
    };

    for (int i = 0; i < strArray.length; i++) {
      if (strArray[i].indexOf("ja") >= 0) {
        System.out.println(strArray[i]);
      }
    }
    for (String str : strArray) {
      if (str.indexOf("ja") >= 0) {
        System.out.println(str);
      }
    }
    //
    // p357
    Student s1 = new Student("222222-2222222", "김삼식");
    System.out.println(s1.toString());

    Student s2 = new Student("222222-2222222", "김삼식");
    System.out.println(s1 == s2);
    System.out.println(s2.equals(s1));

    System.out.println(s1.hashCode());
    System.out.println(s2.hashCode());
    //
    //
  }
}
