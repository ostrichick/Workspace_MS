package j0714_practice;

import java.io.IOException;

public class SchedulerTest {

  public static void main(String[] args) throws IOException {
    System.out.println("전화 상담 할당 방식을 선택하세요");
    System.out.println("R: 한명씩 차례대로 할당");
    System.out.println("L: 쉬고있거나 대기가 적은 상담원에게 할당");
    System.out.println("P: 우선순위가 높은 고객 먼저 할당");
    System.out.println("A: 상담원이 전화를 가져감");

    int ch = System.in.read();
    Scheduler scheduler = null;

    if (ch == 'r' || ch == 'R') {
      scheduler = new RoundRobin();
    } else if (ch == 'l' || ch == 'L') {
      scheduler = new LeastJob();
    } else if (ch == 'p' || ch == 'P') {
      scheduler = new PriorityAllocation();
    } else if (ch == 'a' || ch == 'A') {
      scheduler = new PriorityAllocation();
    } else {
      System.out.println("지원되지 않는 기능입니다");
      return;
    }
    scheduler.getNextCall();
    scheduler.sendCallToAgent();
  }
}
