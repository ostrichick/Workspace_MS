package j0715_wrapper;

import java.util.ArrayList;
import java.util.List;

public class ListMain {

  public static void main(String[] args) {
    List<Integer> list = new ArrayList<Integer>();
    // list 컬렉션에 원소를 추가할때 사용하는 메소드 add()
    list.add(1);
    // list.add(1.0); 오류
    // add(index,value)
    list.add(2);
    list.add(0, 3);
    list.add(3, 5);
    list.add(999);

    // 컬렉션에서 특정 인덱스 요소를 꺼냄 get(index)
    System.out.println(list.get(4));
    // set() 특정 인덱스의 요소 수정
    list.set(4, 666);
    // list 인터페이스 안에 있는 arraylist 객체의 원소 합
    int sum = 0;
    for (int i = 0; i < list.size(); i++) {
      sum += list.get(i);
    }
    System.out.println(sum + "합계");

    //
    System.out.println(list);

    int[] intList = { 1, 2, 3, 4, 5 };
    //    System.out.println(intList);
    intList.getClass();
    /*
     * 학생 객체 10명 생성 학생의 필드 : 이름 나이 영어점수 수학점수 국어점수
     */
    // 홍길일 20 98 87 79
    // 홍길이 21 80 97 86
    // 홍길삼 20 77 79 88
    // 홍길사 20 88 79 80
    // 홍길오 21 75 90 79

    // List 인터페이스의 ArrayList 구현클래스 사용하여 한 반으로 묶기
    // 1. 영어 수학 국어 과목별 고득점자 구하기
    // 2. 각자의 점수 평균
    // 3. 모두의 점수 평균

    Student s1 = new Student("홍길일", 20, 98, 87, 79);
    Student s2 = new Student("홍길이", 21, 80, 97, 86);
    Student s3 = new Student("홍길삼", 20, 77, 79, 88);
    Student s4 = new Student("홍길사", 20, 88, 79, 80);
    Student s5 = new Student("홍길오", 21, 75, 90, 79);

    List<Student> sList = new ArrayList<>();
    sList.add(s1);
    sList.add(s2);
    sList.add(s3);
    sList.add(s4);
    sList.add(s5);

    int engMax = 0;
    int mathMax = 0;
    int korMax = 0;
    String emName = "";
    String mmName = "";
    String kmName = "";
    for (int i = 0; i < sList.size(); i++) {
      if (sList.get(i).english > engMax) {
        engMax = sList.get(i).english;
        emName = sList.get(i).name;
      }
      if (sList.get(i).math > mathMax) {
        mathMax = sList.get(i).math;
        mmName = sList.get(i).name;
      }
      if (sList.get(i).korean > korMax) {
        korMax = sList.get(i).korean;
        kmName = sList.get(i).name;
      }
    }
    System.out.println("영어 최고 득점자 " + emName + " 점수는 " + engMax);
    System.out.println("수학 최고 득점자 " + mmName + " 점수는 " + mathMax);
    System.out.println("국어 최고 득점자 " + kmName + " 점수는 " + korMax);
    for (int i = 0; i < sList.size(); i++) {
      double avg =
        (sList.get(i).english + sList.get(i).math + sList.get(i).korean) / 3;
      System.out.println(sList.get(i).name + "의 평균 점수는 " + avg);
    }
    double wholesum = 0;
    for (int i = 0; i < sList.size(); i++) {
      wholesum +=
        (sList.get(i).english + sList.get(i).math + sList.get(i).korean);
    }
    System.out.println("모두의 평균 점수는 " + wholesum / 5 / 3);
  }
}

class Student {

  String name;
  int age;
  int english;
  int math;
  int korean;

  public Student(String name, int age, int english, int math, int korean) {
    super();
    this.name = name;
    this.age = age;
    this.english = english;
    this.math = math;
    this.korean = korean;
  }
}
