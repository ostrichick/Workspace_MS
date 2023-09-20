package j0714_practice;

public interface Scheduler {
  public void getNextCall();

  public void sendCallToAgent();
}

class RoundRobin implements Scheduler {

  @Override
  public void getNextCall() {
    System.out.println("상담전화를 순서대로 대기열에서 가져옵니다");
  }

  @Override
  public void sendCallToAgent() {
    System.out.println("다음 순서 상담원에게 배분합니다");
  }
}

class LeastJob implements Scheduler {

  @Override
  public void getNextCall() {
    System.out.println("상담전화를 순서대로 대기열에서 가져옵니다");
  }

  @Override
  public void sendCallToAgent() {
    System.out.println(
      "현재 상담 업무가 없거나 대기가 가장 적은 상담원에게 할당합니다"
    );
  }
}

class PriorityAllocation implements Scheduler {

  @Override
  public void getNextCall() {
    System.out.println("고객 등급이 높은 고객의 전화를 대기열에서 가져옵니다");
  }

  @Override
  public void sendCallToAgent() {
    System.out.println("업무 능력이 높은 상담원에게 우선 배분합니다");
  }
}

class AgentGetCall implements Scheduler {

  @Override
  public void getNextCall() {
    System.out.println("상담원이 다음 전화 요청");
  }

  @Override
  public void sendCallToAgent() {
    System.out.println("상담원이 전화 상담을 가져갑니다");
  }
}
