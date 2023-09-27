/**
 * 난수 발생기(정수형 변수는 4바이트를 사용해야 함)
 * seed   : 난수의 초기값으로 9965
 * COUNT  : 각 숫자들의 출현횟수를 계산하기 위한 배열
 * u      : 0.0 ~ 1.0 사이의 난수
 * limit : 시행횟수
 */

import java.lang.*;
import java.io.*;

class RandomGen {
        final int LIMIT=5000;
        final int SEED=9965;
        public float up;
        public int[] COUNT = new int[5];
        public float[] OUT_P = new float[5];
        public PrintWriter out = null;

        public RandomGen() {
                int i;
                for(i=0; i<5; ++i) COUNT[i]=0;
                try {
                     File f = new File("C:\\WORK\\EX1_3.OUT");
                     FileWriter fw = new FileWriter(f);
                     BufferedWriter bw = new BufferedWriter(fw);
                     out = new PrintWriter(bw);
                 } catch(IOException ioe) {}
              }

        public int random(int np, float u){
                np = np * 843314861 + 453816693;
                if(np < 0){
                        np = np + 2147483647;
                        np = np + 1;
                }
                up = (float)(np * 0.4656612e-9);
                return np;
        }

        public void print_p(int i, float u) {
                int j;
                int k;

                k = (i % 5);
                if (k == 4) {
                    OUT_P[k] = u;
                    for (j = 0; j <= 4; ++j)
                         out.print(OUT_P[j] + "   ");
                    out.println();
                }
                else
                  OUT_P[k] = u;
        }

        // THE FREQUENCE TABLE //
        public void freq(float u) {
                float r1 = 0.0f;
                float r2 = 0.2f;
                int i;

                for (i = 0; i < 5; ++i) {
                     if (r1 <= u && u < r2)
                         COUNT[i] = COUNT[i] + 1;
                     r1 = r1 + 0.2f;
                     r2 = r2 + 0.2f;
                }
        }

        // OUTPUT FORMAT //
        public void report() {
                float r1 = 0.0f;
                float r2 = 0.2f;
                int i;

                 out.println("===================");
                 out.println("THE FREQUENCE TABLE");
                 out.println("-------------------");
                 for (i = 0; i < 5; ++i) {
                      out.println(r1 + " - " + r2 + " = " + COUNT[i]);
                      r1 = r1 + 0.2f;
                      r2 = r2 + 0.2f;
                  }
        }

        public void ComputeRandomGen(){
                int i, n = SEED;

                out.println("THE RANDOM NUMBER TEST OUTPUT");
                out.println("=============================");

                i=0;
                while(i < LIMIT) {
                     n = random(n, up);
                     print_p(i, up);
                     freq(up);
                     ++i;
                }
                report();
                if(out != null) out.close();
        }
}

public class EX1_3 {
        public static void main(String[] args) {
                RandomGen r = new RandomGen();
                r.ComputeRandomGen();
        }
}