package ds;

import java.util.*;

public class weather {

  public static void main(String[] args) {
    Weatherdata w20220115_00시 = new Weatherdata(10, 50, 5, 0);
    Weatherdata w20220115_02시 = new Weatherdata(9, 50, 10, 0);
    Weatherdata w20220115_04시 = new Weatherdata(8, 40, 10, 5);
    Weatherdata w20220115_06시 = new Weatherdata(7, 40, 15, 5);
    Weatherdata w20220115_08시 = new Weatherdata(6, 40, 5, 0);
    Weatherdata w20220115_10시 = new Weatherdata(12, 50, 5, 0);
    Weatherdata w20220115_12시 = new Weatherdata(17, 50, 5, 0);
    Weatherdata w20220115_14시 = new Weatherdata(16, 50, 5, 0);
    Weatherdata w20220115_16시 = new Weatherdata(15, 50, 5, 0);
    Weatherdata w20220115_18시 = new Weatherdata(13, 50, 5, 0);
    Weatherdata w20220115_20시 = new Weatherdata(12, 40, 10, 0);
    Weatherdata w20220115_22시 = new Weatherdata(11, 40, 10, 0);

    List<Weatherdata> w20220115_List = new ArrayList<Weatherdata>();
    w20220115_List.add(w20220115_00시);
    w20220115_List.add(w20220115_02시);
    w20220115_List.add(w20220115_04시);
    w20220115_List.add(w20220115_06시);
    w20220115_List.add(w20220115_08시);
    w20220115_List.add(w20220115_10시);
    w20220115_List.add(w20220115_12시);
    w20220115_List.add(w20220115_14시);
    w20220115_List.add(w20220115_16시);
    w20220115_List.add(w20220115_18시);
    w20220115_List.add(w20220115_20시);
    w20220115_List.add(w20220115_22시);
    // List<Weatherdata> w20220116_List = w20220115_List;

    // List<List> w2022_01_List = new ArrayList<>();
    // w2022_01_List.add(w20220115_List);
    // w2022_01_List.add(w20220116_List);
    // System.out.println(
    //   "Max Temperature is " + W_Method.calcMaxTemp(w20220115_List)
    // );
  }
}

class W_Method {

  public static int calcMaxTemp(List<Weatherdata> weatherlist) {
    int maxTemp = 0;
    for (int i = 0; i < weatherlist.size(); i++) {
      if (maxTemp < weatherlist.get(i).getTemperature()) {
        maxTemp = weatherlist.get(i).getTemperature();
      }
    }
    return maxTemp;
  }
}

class Weatherdata {

  int temperature;
  int humidity;
  int wind;
  int rain;

  public Weatherdata(int temperature, int humidity, int wind, int rain) {
    this.temperature = temperature;
    this.humidity = humidity;
    this.wind = wind;
    this.rain = rain;
  }

  public int getTemperature() {
    return temperature;
  }

  public void setTemperature(int temperature) {
    this.temperature = temperature;
  }

  public int getHumidity() {
    return humidity;
  }

  public void setHumidity(int humidity) {
    this.humidity = humidity;
  }

  public int getWind() {
    return wind;
  }

  public void setWind(int wind) {
    this.wind = wind;
  }

  public int getRain() {
    return rain;
  }

  public void setRain(int rain) {
    this.rain = rain;
  }

  @Override
  public String toString() {
    return (
      "Weatherdata [temperature=" +
      temperature +
      ", humidity=" +
      humidity +
      ", wind=" +
      wind +
      ", rain=" +
      rain +
      "]"
    );
  }
}
