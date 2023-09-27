/**
 * 몬테칼로 시뮬레이션
 * limit : 수행횟수(50000)
 * seed  : 난수의 초기값(9965)
 */
import java.lang.*;
import java.io.*;

class Montecarlo {
       public int seed, limit;
       float up;

       public Montecarlo() {
               seed = 9965;
               limit = 50000;
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

       public void ComputeMontecarlo() {
               int i = 1, count = 0;
               float s, x, y;
               PrintWriter out=null;

               try {
                    File f=new File("C:\\WORK\\EX2_1.OUT");
                    FileWriter fw=new FileWriter(f) ;
                    BufferedWriter bw=new BufferedWriter(fw);
                    out=new PrintWriter(bw);

                    out.println(" MONTE CARLO SIMULATION");
                    out.println("========================");
                    out.println(" SEED   = " + seed);
                    while (i <= limit) {
                         seed = random(seed, up);
                         x = up;
                         seed = random(seed, up);
                         y = up;
                         if (x * x + y * y <= 1.0) count++;
                         i++;
                    }

                    s = (float)count / (float)limit;
                    s = s * 4;
                    out.println(" LIMIT  = " + limit);
                    out.println(" COUNT  = " + count);
                    out.println(" RESULT = " + s);
               } catch(IOException ioe) { }
                    finally {
                        if (out != null) out.close();
                    }
      }
}

public class EX2_1 {
      public static void main(String[] args){
             Montecarlo m = new Montecarlo();
             m.ComputeMontecarlo();
     }
}