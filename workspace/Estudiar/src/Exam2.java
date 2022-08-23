public class Exam2 {

  public static void main(String[] args) {
    // 1. String
    // 2. 1234
    double d = 1234.678;
    int x2 = (int) d;
    System.out.println(x2);
    // 3. psvm
    // 4.
    String str = "result :";
    int x4 = 10;
    System.out.println(str + (x4 + 1));
    // 5. sum += i;
    int sum5 = 0;
    for (int i = 1; i <= 100; i++) {
      sum5 += i;
    }
    System.out.println(sum5);
    // 6.
    int[] Ary = { 10, 20, 30, 40, 50 };
    int Sum = 0;
    for (int i = 0; i < Ary.length; i++) {
      Sum += Ary[i];
    }
    System.out.println(Sum);
    // 7.
    class Student7 {

      String Name;
      int Age;
    }
    // 8.
    class Student8 {

      protected int Average = 0;

      Student8(int scoreA, int scoreB, int scoreC) {
        Average = (scoreA + scoreB + scoreC) / 3;
      }

      public int getAverage() {
        return Average;
      }
    }
    int scoreA = 10;
    int scoreB = 20;
    int scoreC = 30;
    Student8 s = new Student8(scoreA, scoreB, scoreC);
    System.out.println("AVGSCORE IS " + s.getAverage());
    // 9. 2
    // 10. NullPointerException
    // 11. 3
    // 12. 1, 3
    // 13.
    int sum = 0;
    for (int i = 1; i <= 100; i++) {
      if (i % 2 == 0) {
        sum += i;
      }
    }
    System.out.println(sum);

    // 14.

    try {
      int x = 10, y = 0, z = 0;
      z = x / y;
      System.out.println("z is " + z);
    } catch (Exception e) {
      e.printStackTrace();
    }
    // 15. MyClass.class
    // 16. Catch, Finally
    // 17. 1
    // 18. 2
    // 19.

    for (int i = 1; i <= 9; i++) {
      if (i % 2 == 0) {
        for (int j = 1; j <= 9; j++) {
          if (j % 2 == 0) {
            System.out.println(i + "x" + j + "=" + i * j);
          }
        }
      }
    }
    // 20.ㅇ

    int sum20 = 0;
    for (int i = 0; i < 10; i++) {
      int x = sum20 + i;
      sum20 = x;
    }
    System.out.println("ㅎsum is " + sum20 + ", x is ㅇ" + "ㅇ");
  }
}
