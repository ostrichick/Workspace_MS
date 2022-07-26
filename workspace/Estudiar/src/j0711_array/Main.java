package j0711_array;

public class Main {

  public static void main(String[] args) {
    //		int[] intArray = null; // 배열은 참조타입이기 때문에 null로 참조할 주소를 없애고 초기화할수있음

    // 배열 선언시 데이터 초기화 {} 중괄호 블럭 사용 "," 구분자로 데이터 나열
    int[] intArray = { 10, 20, 30, 40, 50 };

    intArray.getClass();
    // 배열 선언 후 값 대입하는 법: new 연산자를 이용해 배열을 생성하며 값 대입
    int[] intArray2 = null;
    intArray2 = new int[] { 10, 20, 30, 40, 50 };
    intArray2.getClass();
    // 배열 선언시 원소는 모르나 길이를 사용하여 배열생성하는 방법
    int[] intArray3 = new int[3];

    // 배열의 원소에 접근하는 방법 [index]
    int data = intArray3[0];
    System.out.println(data);

    int[] newArray = { 10, 20, 30 };
    int[] newArray2 = new int[5];

    int sum = 0;
    for (int idx : newArray) {
      sum += idx;
    }
    System.out.println(sum);

    // 자바 배열은 길이가 정해지면 해당 인덱스까지만 접근가능. 넘치는 인덱스에 접근불가
    //		System.out.println(newArray[3]);

    for (int idx : newArray) {
      System.out.println(idx);
    }
    int counter = 0;

    for (int idx2 : newArray2) {
      idx2 = counter;
      System.out.println(idx2);
      counter++;
    }

    // 학생 세명 생성 홍길일230 홍길이190 홍길삼280

    Student s1 = new Student("홍길일", 230);
    Student s2 = new Student("홍길이", 190);
    Student s3 = new Student("홍길삼", 280);
    s1.getClass();
    s2.getClass();
    s3.getClass();
    //		Student[] studentList = { s1, s2, s3 };
    //		Student[] studentList = new Student[] { s1, s2, s3 };
    Student[] studentList = new Student[] {
      new Student("홍길일", 230),
      new Student("홍길이", 190),
      new Student("홍길삼", 280),
    };

    // 배열의 데이터 타입이 참조타입이면 데이터의 주소를 참조중
    String[] strArray2 = { new String("가"), new String("가") };
    System.out.println(strArray2[0] == strArray2[1]);

    for (int i = 0; i < studentList.length; i++) {
      //			studentList[i] ;
    }

    int scoreList[] = {
      studentList[0].getTotalScore(),
      studentList[1].getTotalScore(),
      studentList[2].getTotalScore(),
    };
    System.out.println(scoreList);
    int sum2 = 0;
    for (int i = 0; i < scoreList.length; i++) {
      sum2 += scoreList[i];
    }
    double avg = sum2 / scoreList.length;
    System.out.println("평균 점수는 " + avg);

    int maxScore = 0; // 점수 최대값
    int scoreIndex = 0; // 최대값을 가진 학생의 배열내 인덱스 숫자
    String maxScoreName = "";
    for (int i = 0; i < scoreList.length; i++) {
      //			if (i > 0) {
      //				if (scoreList[i - 1] > scoreList[i]) {
      //					maxScore = scoreList[i - 1];
      //					scoreIndex = i - 1;
      //				} else
      //					scoreIndex = i;
      //				maxScore = scoreList[i];
      if (scoreList[i] > maxScore) {
        maxScore = scoreList[i];
        scoreIndex = i;
      }
    }
    System.out.println(
      "가장 큰 점수는 " +
      maxScore +
      ", 학생 이름은 " +
      studentList[scoreIndex].getName() +
      maxScoreName
    );

    // 향상된 for (배열의 인덱스에 알아서 반복하며 원소를 자동으로 꺼내변수에 담는다)
    // 배열 sL의 모든 인덱스에 반복접근하며 각 원소는 tempStudent에 담아라
    // 현재 접근하고 있는 인덱스 값이 필요 없는 경우 사용
    for (Student tempStudent : studentList) {
      System.out.println(tempStudent.getName());
    }

    int[] intArray5 = { 10, 20, 30, 40, 50 };

    int eleSum = 0;
    for (int ele : intArray5) {
      eleSum += ele;
    }
    System.out.println(eleSum);

    // 2차원 행렬
    // 변수 선언시
    int[][] intArray6 = { { 1, 2, 3 }, { 4, 5, 6 } };
    /*
     * 1 2 3 4 5 6
     */
    int result = intArray6[0][1];
    System.out.println(result);

    Student[][] sArray = new Student[2][3];
    sArray[0][0] = new Student();
    sArray[0][1] = new Student();
    sArray[0][2] = new Student();
    // sArray[0][3] = new Student(); // 넘치는 인덱스에 데이터를 넣을땐 오류가 안나도 출력할때 오류가 남

    // 자바 배열은 길이 고정이니 배열 길이변경을 원하면 더 큰 배열을 만들어 하나씩 복사
    int[] intArray20 = new int[] { 10, 20, 30, 40, 50 };
    int[] copyArray = new int[10];
    for (int i = 0; i < intArray20.length; i++) {
      copyArray[i] = intArray20[i];
    }
    for (int i = intArray20.length; i < copyArray.length; i++) {
      int temp = i * 10;
      copyArray[i] = temp;
    }
    //
    // 연습
    //
    int[] num = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    sum = 0;
    for (int temp : num) {
      sum += temp;
    }
    System.out.println(sum);

    int[] numArray = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    for (int number : numArray) {
      System.out.println(number);
    }

    Student[] studentArray = new Student[] {
      new Student("김삼식", 500),
      new Student("박충재", 600),
      new Student("구정물", 400),
    };

    for (int i = 0; i < studentArray.length; i++) {
      studentArray[i].showStudentInfo();
    }

    char[] abc = new char[26];
    char ch = 'a';
    for (int i = 0; i < abc.length; i++, ch++) {
      abc[i] = ch;
    }
    for (int i = 0; i < abc.length; i++) {
      System.out.println(abc[i] + "," + (int) abc[i]);
    }
    //
    char[][] abc2 = new char[13][2];
    ch = 'a';
    for (int i = 0; i < abc2.length; i++) {
      for (int j = 0; j < abc2[i].length; j++, ch++) {
        abc2[i][j] = ch;
      }
      System.out.println(abc2[i][0] + "," + abc2[i][1]);
    }

    //
    int tenIndex = 0;
    int[] tenNum = new int[5];
    for (int i = 1; i < 11; i++) {
      if (i % 2 == 0) {
        tenNum[tenIndex] = i;
        tenIndex++;
      }
    }
    sum = 0;
    for (int temp : tenNum) {
      sum += temp;
    }
    System.out.println(sum); // 30
    //
    //
    //
  }
}
