/**
 * 저축 시뮬레이션
 * salary : 연봉
 * savings : 저축액
 * year : 시뮬레이션 시간으로 단위는 1년
 * perinc : 연봉의 인상률로 5%
 * perint : 복리이자로 5%
 */
import java.lang.*;
import java.io.*;

class Savings {
       final static float perinc = 0.05f;
       final static float perint = 0.05f;
       public double salary, saving;
       public int year;

       public Savings() {
              salary = 12000000.0;
              saving = 0.0;
              year = 0;
       }

       public void ComputeSavings() {
             PrintWriter out=null;

             try {
                  File f=new File("C:\\WORK\\EX1_1.OUT");
                  FileWriter fw=new FileWriter(f) ;
                  BufferedWriter bw=new BufferedWriter(fw);
                  out=new PrintWriter(bw);

                  out.println("  SAVING INVESTMENT SIMULATION");
                  out.println("================================");
                  out.println("SALARY INCREASE RATE IS   " + perinc);
                  out.println("INTEREST RATE ON SAVINGS  " + perint);
                  out.println("================================");
                  out.println("YEAR	  SALARY       SAVINGS");
                  out.println("--------------------------------");
                  out.println(year + "        " + (int) salary + "     " + (int) saving);
                  while (year < 30) {
                         ++year;
                         saving = saving + (perint * saving) + (0.10 * salary);
                         salary = salary + (perinc * salary);
                         out.println(year + "        " + (int) salary + "     " + (int) saving);
                  }
            } catch(IOException ioe) { }
              finally {
                  if (out != null) out.close();
              }
        }
}

public class EX1_1 {
       public static void main(String[] args) {
              Savings s = new Savings();
              s.ComputeSavings();
       }
}




