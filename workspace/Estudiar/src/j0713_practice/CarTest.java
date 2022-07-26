package j0713_practice;

import java.util.ArrayList;

public interface CarTest {
  public static void main(String[] args) {
    ArrayList<Car2> carList = new ArrayList<Car2>();
    carList.add(new Sonata());
    carList.add(new Grandeur());
    carList.add(new Avante());
    carList.add(new Genesis());
    for (Car2 car : carList) {
      car.run();
      System.out.println("=====");
    }
    //
    Bus bus = new Bus();
    AutoCar autoCar = new AutoCar();

    bus.run();
    autoCar.run();
    bus.refuel();
    autoCar.refuel();
    bus.takePassenger();
    autoCar.load();
    bus.stop();
    autoCar.stop();
    System.out.println("==========");
    Car2 aicar = new AICar();
    aicar.run();
    aicar.wiper();
    Car2 mannualcar = new ManualCar();
    mannualcar.run();
    mannualcar.wiper();
  }
}

class AICar extends Car2 {

  @Override
  public void drive() {
    System.out.println("자율 주행");
    System.out.println("방향 전환");
  }

  @Override
  public void stop() {
    System.out.println("차가 스스로 멈춥니다");
  }

  @Override
  public void wiper() {
    System.out.println("기상 환경에 따른 자동 와이퍼 조절");
  }
}

class ManualCar extends Car2 {

  @Override
  public void drive() {
    System.out.println("운전자가 운전");
    System.out.println("핸들 조작 방향 전환");
  }

  @Override
  public void stop() {
    System.out.println("브레이크를 밟아 정지");
  }

  @Override
  public void wiper() {
    System.out.println("사람이 직접 와이퍼 조절");
  }
}

class Bus extends Car {

  @Override
  public void run() {
    System.out.println("버스가 달립니다.");
  }

  @Override
  public void refuel() {
    System.out.println("천연가스를 충전합니다");
  }

  public void takePassenger() {
    System.out.println("승객을 버스에 태웁니다");
  }
}

class AutoCar extends Car {

  @Override
  public void refuel() {
    System.out.println("휘발유를 주유합니다");
  }

  public void load() {
    System.out.println("짐을 싣습니다");
  }
}
