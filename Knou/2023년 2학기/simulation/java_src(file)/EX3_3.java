/**
 * 단일창구 평균 대기시간 시뮬레이션
 * tpump  : 고객에 대한 봉사시간(단위 : 분)
 * queue  : 줄에서 기다리고 있는 사람(차량) 수, 대기행렬의 길이
 * prarr  : 고객이 1분내에 도착할 확률
 * arrive : 0 = 고객이 도착하지 않은 경우
 *          1 = 고객이 도착한 경우
 * time   : 시뮬레이션의 현재시간(단위 : 분)
 * tstep  : 시뮬레이션 진행 단위시간
 * tlimit : 총 시뮬레이션 수행시간
 * toarr  : 도착한 총 고객수
 * totque : 대기행렬 queue의 전체 합(전체 고객의 총 대기시간)
 * aveque : 대기행렬 queue의 평균길이
 * avgwt  : 평균대기시간
 * seed   : 난수의 초기값
 */
import java.io.*;
import java.lang.*;

class MeanQueueing {

  static final int SEED = 366307; // 난수의 초기값
  public int n, p, seed; // 난수의 초기값, 포아송분포
  public float up, mean; // 난수, 포아송분포의 평균
  public String StrTime = new String();

  // Queueing 생성자
  public MeanQueueing() {
    mean = 5; // 봉사 형태
    n = SEED; //
    seed = SEED;
  }

  public int random(int np, float u) { // 난수 생성
    np = np * 843314861 + 453816693; // 난수 생성
    if (np < 0) { // 난수가 음수이면
      np = np + 2147483647; // 양수로 변환
      np = np + 1; // 양수로 변환
    }
    up = (float) (np * 0.4656612e-9); // 난수 생성
    return np; // 난수 반환
  }

  public int poissn(int np, int pp) { // 포아송분포 생성
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

  public void ConvDataToString(int time) { // 시간을 문자열로 변환
    int i, len;

    StrTime = "";
    StrTime = StrTime.valueOf(time);
    len = StrTime.length();
    if (len < 3) for (i = 0; i < (3 - len); i++) StrTime = "0" + StrTime;
  }

  public void ComputeQueueing() {
    int queue = 0, totque = 0, totarr = 0, arrive, tstep = 1;
    float prarr = 22.0f / 60.0f; // 도착 형태
    float tlimit = 50.0f; // 시뮬레이션 시간
    float tpump = 0.0f, time = 0.0f, aveque = 0.0f, avgwt = 0.0f;
    PrintWriter out = null;

    try {
      File f = new File("C:\\WORK\\EX3_3.txt");
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
      out.println("===============================");
      out.println("TIME    ARRIVAL  QUEUE    TPUMP");
      out.println("-------------------------------");

      while (time < tlimit) {
        time = time + tstep;
        arrive = 0;
        seed = random(seed, up);

        if (up < (prarr * tstep)) {
          arrive = 1;
          queue = queue + arrive;
          totarr = totarr + 1;
        }
        if (tpump > 0.0) {
          tpump = tpump - tstep;
          if (tpump < 0) tpump = 0.0f;
        }
        if ((tpump == 0) && (queue != 0)) {
          queue = queue - 1;
          p = poissn(n, p);
          tpump = p;
        }
        totque = totque + queue;
        ConvDataToString((int) time);
        out.println(
          StrTime +
          "        " +
          arrive +
          "       " +
          queue +
          "        " +
          (int) tpump
        );
      }
      out.println("-------------------------------");
      out.println("THE SIMULATED TIME = " + tlimit);
      out.println("THE TOTAL ARRIVALS = " + totarr);
      aveque = totque / (tlimit / tstep);
      avgwt = totque / (float) totarr;
      out.println("MEAN QUEUE LENGTH  = " + aveque);
      out.println("MEAN WAITING TIME  = " + avgwt);
    } catch (IOException ioe) {} finally {
      if (out != null) out.close();
    }
  }
}

public class EX3_3 {

  public static void main(String[] args) {
    MeanQueueing g = new MeanQueueing();
    g.ComputeQueueing();
  }
}
