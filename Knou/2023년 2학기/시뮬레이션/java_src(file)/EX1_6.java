/**
 * 단일창구 대기행렬 시뮬레이션
 * tpump : 고객에 대한 봉사시간(단위 : 분)
 * queue : 줄에서 기다리고 있는 사람(차량) 수, 대기행렬의 길이
 * prarr : 고객이 1분내에 도착할 확률
 * arrive : 0 = 고객이 도착하지 않은 경우
 *          1 = 고객이 도착한 경우
 * time : 시뮬레이션의 현재시간(단위 : 분)
 * tstep : 시뮬레이션 진행 단위시간
 * tlimit : 총 시뮬레이션 수행시간
 * toarr : 도착한 총 고객수
 * totque : 대기행렬 queue의 전체 합(=전체 고객의 총 대기시간0
 * aveque : 대기행렬 queue의 평균길이
 * seed : 난수의 초기값
 */
import java.io.*;
import java.lang.*;

class SingleQueueing { // 단일창구 대기행렬 시뮬레이션

  static final int SEED = 366307; // 난수의 초기값
  public int n, seed, p; // 난수의 초기값, 난수, 포아송분포
  public float up, mean; // 난수, 포아송분포의 평균
  public String StrTime = new String(); // 시간을 문자열로 변환

  public SingleQueueing() {
    mean = 4;
    seed = SEED;
    n = SEED;
  }

  public int random(int np, float u) {
    np = np * 843314861 + 453816693;
    if (np < 0) {
      np = np + 2147483647;
      np = np + 1;
    }
    up = (float) (np * 0.4656612e-9);
    return np;
  }

  public int poissn(int np, int pp) {
    float b, prod;

    pp = 0;
    b = (float) (Math.exp(-mean));

    prod = 1;
    n = random(np, up);
    prod = prod * up;

    while (prod >= b) {
      n = random(n, up);
      prod = prod * up;
      ++pp;
    }
    return pp;
  }

  public void ConvDataToString(int time) {
    int i, len;

    StrTime = "";
    StrTime = StrTime.valueOf(time);
    len = StrTime.length();
    if (len < 3) for (i = 0; i < (3 - len); i++) StrTime = "0" + StrTime;
  }

  public void ComputeQueueing() {
    int queue = 0, totque = 0, time = 0, totarr = 0, arrive, tstep = 1;
    double prarr = 1.0 / 4.0, tpump = 0.0, tlimit = 100, aveque = 0, avetime =
      0;
    PrintWriter out = null;

    try {
      File f = new File("C:\\WORK\\EX1_6.OUT");
      FileWriter fw = new FileWriter(f);
      BufferedWriter bw = new BufferedWriter(fw);
      out = new PrintWriter(bw);

      out.println("SIMULATION FOR A QUEUEING SYSTEM");
      out.println("=================================");
      out.println("THE TIME STEP           = " + tstep);
      out.println("THE TIME LIMIT          = " + tlimit);
      out.println("THE ARRIVAL PROBABILITY = " + prarr);
      out.println("THE POISSON MEAN        = " + (int) mean);
      out.println("THE SEED                = " + seed);
      out.println("=================================");
      out.println("TIME    ARRIVAL    QUEUE    TPUMP");
      out.println("---------------------------------");

      while (time < tlimit) {
        time = time + tstep;
        arrive = 0;
        seed = random(seed, up);

        if (up < prarr * tstep) {
          arrive = 1;
          queue = queue + arrive;
          totarr = totarr + 1;
        }
        if (tpump > 0.0) {
          tpump = tpump - tstep;
          if (tpump < 0) tpump = 0;
        }
        if (tpump == 0 && queue != 0) {
          queue = queue - 1;
          p = poissn(n, p);
          tpump = p;
        }
        totque = totque + queue;
        ConvDataToString(time);
        out.println(
          " " +
          StrTime +
          "      " +
          arrive +
          "          " +
          queue +
          "        " +
          (int) tpump
        );
      }
      aveque = totque / (tlimit * tstep);

      out.println("---------------------------------");
      out.println("MEAN QUEUE LENGTH  = " + aveque);
      out.println("THE TOTAL ARRIVALS = " + totarr);
    } catch (IOException ioe) {} finally {
      if (out != null) out.close();
    }
  }
}

public class EX1_6 {

  public static void main(String[] args) {
    SingleQueueing g = new SingleQueueing();
    g.ComputeQueueing();
  }
}
