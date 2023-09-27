/*--------------------------------------------------------------
 * 복수창구 대기행렬 시뮬레이션
 * tpump    : 고객에 대한 봉사시간(단위 : 분)
 * queue    : 줄에서 기다리고 있는 사람(차량) 수, 대기행렬의 길이
 * prarr    : 고객이 1분내에 도착할 확률
 * arrive   : 0 = 고객이 도착하지 않은 경우,
 *            1 = 고객이 도착한 경우
 * time     : 시뮬레이션의 현재시간(단위 : 분)
 * tstep    : 시뮬레이션 진행 단위 시간
 * tlimit   : 총 시뮬레이션 수행 시간
 * totarr   : 도착한 총 고객수
 * totque   : 대기행렬 queue 의 전체 합 (＝전체 고객의 총 대기시간)
 * aveque   : 대기행렬 queue 의 평균길이
 * seed     : 난수의 초기값
 * tpump(i) : 봉사시간
 *-------------------------------------------------------------*/
import java.lang.*;
import java.io.*;

class DoubleQueueing {
        final static int SEED = 35213;
        public int n, p, seed;
        public float up, mean;
        public String StrTime = new String();

        public DoubleQueueing(){
               mean = 4;
               n = SEED;
               seed = SEED;
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

        public int poissn(int np, int pp){
                float b, prod;
                pp = 0;
                b = (float)(Math.exp(-mean));

                prod = 1;
                n = random(np, up);
                prod = prod * up;

                while(prod >= b){
                        n = random(n, up);
                        prod = prod * up;
                        ++pp;
                }
                return pp;
        }

        public void ConvDataToString(int time){
               int i, len;

               StrTime = "";
               StrTime = StrTime.valueOf(time);
               len = StrTime.length();
               if(len < 3)
                    for(i = 0; i < (3-len); i++)
                         StrTime = "0" + StrTime;
        }

        public void ComputeQueueing(){
                int i, queue = 0, totque = 0, totarr=0, arrive, tstep = 1;
                float prarr=1.0f/3.0f, time=0, tlimit=100, aveque=0;
                float tpump[] = new float[3];
                tpump[1] = 0;
                tpump[2] = 0;
                PrintWriter out=null;

                try {
                     File f=new File("C:\\WORK\\EX3_1.OUT");
                     FileWriter fw=new FileWriter(f) ;
                     BufferedWriter bw=new BufferedWriter(fw);
                     out=new PrintWriter(bw);

                     out.println(" SIMULATION FOR DOUBLE QUEUEING SYSTEM");
                     out.println("=========================================");
                     out.println("THE TIME STEP           = " + tstep);
                     out.println("THE TIME LIMIT          = " + (int)tlimit);
                     out.println("THE ARRIVAL PROBABILITY = " + (float)((int)(prarr*100))/100);
                     out.println("THE POISSON MEAN        = " + (int)mean);
                     out.println("THE SEED                = " + n);
                     out.println("-----------------------------------------");
                     out.println(" TIME  ARRIVAL  QUEUE  TPUMP[1]  TPUMP[2]");

                     while(time < tlimit) {
                             time = time + tstep;
                             arrive = 0;
                             seed = random(seed, up);
                             if(up < (prarr*tstep)) {
                                     arrive = 1;
                                     queue = queue + arrive;
                                     totarr = totarr + 1;
                             }
                             i = 0;

                             while(i < 2) {
                                     i++;
                                     if(tpump[i] > 0) {
                                             tpump[i] = tpump[i]-tstep;
                                             if(tpump[i] < 0.0)
                                                      tpump[i] = 0.0f;
                                     }
                                     if((tpump[i]==0.0) && (queue!=0)) {
                                             queue = queue - 1;
                                             p = poissn(n, p);
                                             tpump[i] = p;
                                     }
                             }
                             totque = totque + queue;
                             ConvDataToString((int)time);
                             out.println(" " + StrTime + "      " + arrive + "       " + queue + "       " +
                                                (int)tpump[1] + "         " + (int)tpump[2]);
                     }
                     aveque = totque / (tlimit*tstep);

                     out.println("-------------------------------------");
                     out.println("MEAN QUEUE LENGTH = " + aveque);
                     out.println("THE TOTAL ARRIVALS = " + totarr);
                     out.println("-------------------------------------");
                 } catch(IOException ioe) { }
                   finally {
                         if (out != null) out.close();
                   }
        }
}

public class EX3_1 {
        public static void main(String[] args){
                DoubleQueueing g = new DoubleQueueing();
                g.ComputeQueueing();
        }
}
