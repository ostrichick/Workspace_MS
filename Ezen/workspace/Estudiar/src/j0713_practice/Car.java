package j0713_practice;

public abstract class Car {

  public void run() {
    System.out.println("차가 달립니다");
  }

  public abstract void refuel();

  public void stop() {
    System.out.println("차가 멈춥니다");
  }
}

abstract class Car2 {

  public abstract void drive();

  public abstract void stop();

  public abstract void wiper();

  public void startCar() {
    System.out.println("시동을 켭니다");
  }

  public void turnOff() {
    System.out.println("시동을 끕니다");
  }

  public final void run() {
    startCar();
    drive();
    stop();
    turnOff();
    washCar();
  }

  public void washCar() {
    System.out.println("세차를 합니다");
  }
}

class Sonata extends Car2 {

  String name = "Sonata";

  public void drive() {
    System.out.println(this.name + "가 달립니다");
  }

  public void stop() {
    System.out.println(this.name + "가 멈춥니다");
  }

  public void startCar() {
    System.out.println(this.name + "시동을 켭니다");
  }

  public void turnOff() {
    System.out.println(this.name + "시동을 끕니다");
  }

  public void wiper() {}
}

class Grandeur extends Car2 {

  String name = "Grandeur";

  public void drive() {
    System.out.println(this.name + "가 달립니다");
  }

  public void stop() {
    System.out.println(this.name + "가 멈춥니다");
  }

  public void startCar() {
    System.out.println(this.name + "시동을 켭니다");
  }

  public void turnOff() {
    System.out.println(this.name + "시동을 끕니다");
  }

  public void wiper() {}
}

class Avante extends Car2 {

  String name = "Avante";

  public void drive() {
    System.out.println(this.name + "가 달립니다");
  }

  public void stop() {
    System.out.println(this.name + "가 멈춥니다");
  }

  public void startCar() {
    System.out.println(this.name + "시동을 켭니다");
  }

  public void turnOff() {
    System.out.println(this.name + "시동을 끕니다");
  }

  public void wiper() {}
}

class Genesis extends Car2 {

  String name = "Genesis";

  public void drive() {
    System.out.println(this.name + "가 달립니다");
  }

  public void stop() {
    System.out.println(this.name + "가 멈춥니다");
  }

  public void startCar() {
    System.out.println(this.name + "시동을 켭니다");
  }

  public void turnOff() {
    System.out.println(this.name + "시동을 끕니다");
  }

  public void wiper() {}
}
