/**
 * 공의 탄성 시뮬레이션
 * t       : 시간
 * t step  : 시간 증가치
 * bounce  : 공이 튀어오른 수
 * nbounce : 시뮬레이션을 위한 bounce 숫자
 * x,y     : 공의 x,y 좌표
 * Vx      : x좌표의 속도
 * Vyold   : 초기 y좌표의 속도
 * Vynew   : tstep경과 후의 y좌표 속도
 * ay      : y좌표의 가속도
 * angle   : 공이 떨어진 각도, 80˚로 한다.
 */

import java.io.*;
import java.lang.*;

/* 공의 탄성 전역변수 클래스 전체적 하나만 선언 */
class BouncingBall {

  static final float pi = 3.1415926f;
  static final float ay = -9.8f;
  public int bounce, nbounc;
  public float v, angle, tstep, x, y, theta, vx, vyold, vynew, t;
  public String StrX = new String();
  public String StrY = new String();

  public BouncingBall() {
    v = 10.0f;
    angle = 80.0f;
    nbounc = 3;
    tstep = 0.10f;
    x = 0.0f;
    y = 0.0f;
    theta = angle * pi / 180;
    vx = v * (float) Math.cos(theta);
    vyold = v * (float) Math.sin(theta);

    bounce = 0;
    t = 0.0f;
  }

  public void ConvDataToString() {
    int i, len;

    StrX = "";
    StrX = StrX.valueOf(x);
    len = StrX.length();
    if (len < 8) for (i = 0; i < (8 - len); i++) StrX = StrX + "0"; else if (
      len > 8
    ) StrX = StrX.substring(0, 8);

    StrY = "";
    StrY = StrY.valueOf(y);
    len = StrY.length();
    if (len < 8) for (i = 0; i < (8 - len); i++) StrY = StrY + "0"; else if (
      len > 8
    ) StrY = StrY.substring(0, 8);
  }

  public void ComputeBouncingBall() {
    int b;

    PrintWriter out = null;

    try {
      File f = new File("C:\\WORK\\EX1_2.OUT");
      FileWriter fw = new FileWriter(f);
      BufferedWriter bw = new BufferedWriter(fw);
      out = new PrintWriter(bw);

      out.println("  BOUNCING BALL SIMULATION");
      out.println("=============================");
      out.println(" X-CORDINATE	 Y-CORDINATE");

      while (bounce < nbounc) {
        t = t + tstep;
        x = x + vx * tstep;
        vynew = vyold + ay * tstep;
        y = y + (vyold + vynew) * tstep / 2.0f;
        vyold = vynew;

        ConvDataToString();
        out.print(" " + StrX + "        " + StrY);

        /* 공의 탄성 상태 그래프 생성 */
        for (b = 0; b < Math.round(y * 3); b++) {/* bounding 3회 적용 */
          out.print("  ");
        }
        out.println("●");

        if (y < 0.0) {/* 공의 위치가 거의 바닥에 닿았을 때의 경우 계산 */
          vyold = Math.abs(0.75f * vyold);
          y = 0.0f;
          ++bounce;
        }
      }
    } catch (IOException ioe) {} finally {
      if (out != null) out.close();
    }
  }
}

public class EX1_2 {

  public static void main(String[] args) {
    BouncingBall b = new BouncingBall();
    b.ComputeBouncingBall();
  }
}
