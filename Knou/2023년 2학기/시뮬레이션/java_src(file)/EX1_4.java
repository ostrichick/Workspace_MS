/**
 * 저축 시뮬레이션 2
 * salary : 연봉
 * savings : 저축액
 * year : 시뮬레이션 시간으로 단위는 1년
 * perinc : 연봉의 인상률로 0~10% 일양 확률변수
 * perint : 복리이자로 5%
 */
import java.io.*;
import java.lang.*;

class Savings2 {

  final int SEED = 35213;
  final float perint = 0.05f;
  public int year;
  public float salary, saving, perinc, perlow, perhig, up;
  public String StrPerinc = new String();
  public String StrYear = new String();

  public Savings2() {
    salary = 12000000.0f;
    saving = 0.0f;
    perinc = 0;
    year = 0;

    perlow = 0.0f;
    perhig = 10.0f;
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

  public void ConvDataToString() {
    int i, len;

    StrPerinc = "";
    StrPerinc = StrPerinc.valueOf(perinc);
    len = StrPerinc.length();
    if (len < 4) for (i = 0; i < (4 - len); i++) StrPerinc =
      StrPerinc + "0"; else if (len > 4) StrPerinc = StrPerinc.substring(0, 4);

    if (year < 10) StrYear = "0" + StrYear.valueOf(year); else StrYear =
      StrYear.valueOf(year);
  }

  public void ComputeSaving() {
    int n = SEED;
    PrintWriter out = null;

    try {
      File f = new File("C:\\WORK\\EX1_4.OUT");
      FileWriter fw = new FileWriter(f);
      BufferedWriter bw = new BufferedWriter(fw);
      out = new PrintWriter(bw);

      out.println("     SAVING2 SIMULATION WITH RANDOM");
      out.println("==========================================");
      out.println("SALARY INCREASE RATE IS  " + perlow + " - " + perhig);
      out.println("INTEREST RATE ON SAVINGS " + perint);
      out.println("==========================================");
      out.println("YEAR  SALARY.INC.RATE  SALARY      SAVING");
      out.println("------------------------------------------");
      ConvDataToString();
      out.print(" " + StrYear + "          " + StrPerinc);
      out.println("      " + (int) salary + "    " + (int) saving);
      while (year < 30) {
        year++;
        saving = saving + perint * saving + (0.10f * salary);
        n = random(n, up);
        perinc = (int) (up * (perhig + 1 - perlow) + perlow);
        perinc = perinc * 0.01f;
        salary = salary + perinc * salary;
        ConvDataToString();
        out.print(" " + StrYear + "          " + StrPerinc);
        out.println("      " + (int) salary + "    " + (int) saving);
      }
    } catch (IOException ioe) {} finally {
      if (out != null) out.close();
    }
  }
}

public class EX1_4 {

  public static void main(String[] args) {
    Savings2 s2 = new Savings2();
    s2.ComputeSaving();
  }
}
