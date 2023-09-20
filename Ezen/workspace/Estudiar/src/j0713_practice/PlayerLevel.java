package j0713_practice;

public abstract class PlayerLevel {

  public abstract void run();

  public abstract void jump();

  public abstract void turn();

  public abstract void showLevelMessage();

  public final void go(int count) {
    run();
    for (int i = 0; i < count; i++) {
      jump();
    }
    turn();
  }
}

class BeginnerLevel extends PlayerLevel {

  @Override
  public void run() {
    System.out.println("천천히 달립니다");
  }

  @Override
  public void jump() {
    System.out.println("아직 점프할 수 없습니다");
  }

  @Override
  public void turn() {
    System.out.println("아직 턴할 수 없습니다");
  }

  @Override
  public void showLevelMessage() {
    System.out.println("== 초보자 입니다 ==");
  }
}

class IntermediateLevel extends PlayerLevel {

  @Override
  public void run() {
    System.out.println("빨리 달립니다");
  }

  @Override
  public void jump() {
    System.out.println("높이 점프합니다");
  }

  @Override
  public void turn() {
    System.out.println("아직 턴할 수 없습니다");
  }

  @Override
  public void showLevelMessage() {
    System.out.println("== 중급자 입니다 ==");
  }
}

class AdvancedLevel extends PlayerLevel {

  @Override
  public void run() {
    System.out.println("초고속으로 달립니다");
  }

  @Override
  public void jump() {
    System.out.println("높이 점프합니다");
  }

  @Override
  public void turn() {
    System.out.println("빠르게 한바퀴 돕니다");
  }

  @Override
  public void showLevelMessage() {
    System.out.println("== 고급자 입니다 ==");
  }
}
