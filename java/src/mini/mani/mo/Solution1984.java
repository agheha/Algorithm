/*
 <SW 아카데미 1984번 문제>
 10개의 수를 입력 받아, 최대 수와 최소 수를 제외한 나머지의 평균값을 출력하는 프로그램을 작성하라.

(소수점 첫째 자리에서 반올림한 정수를 출력한다.)


[제약 사항]

각 수는 0 이상 10000 이하의 정수이다.


[입력]

가장 첫 줄에는 테스트 케이스의 개수 T가 주어지고, 그 아래로 각 테스트 케이스가 주어진다.

각 테스트 케이스의 첫 번째 줄에는 10개의 수가 주어진다.


[출력]

출력의 각 줄은 '#t'로 시작하고, 공백을 한 칸 둔 다음 정답을 출력한다.

(t는 테스트 케이스의 번호를 의미하며 1부터 시작한다.)

입력
3      
3 17 1 39 8 41 2 32 99 2 
22 8 5 123 7 2 63 7 3 46 
6 63 2 3 58 76 21 33 8 1   

출력
#1 18
#2 20
#3 24
 
 */
package mini.mani.mo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
 
public class Solution1984 { 
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
 
        int repeat = Integer.parseInt(br.readLine());
         
 
        for (int i = 1; i <= repeat; i++) {
             
            String[] arr = br.readLine().split(" ");
             
            double max = 0;
            double min = 10000;
             
            double sum = 0; 
             
            double[] numbers = new double[10];
             
            for (int j = 0; j < arr.length; j++) {
                numbers[j] = Double.parseDouble(arr[j]);
                 
                sum += numbers[j];
            }
             
            for (int j = 0; j < arr.length; j++) {
                max = max < numbers[j] ? numbers[j] : max;
                min = min > numbers[j] ? numbers[j] : min;
            }
             
            sum = sum - max - min;
             
            System.out.printf("#%d %d\n", i, Math.round(sum/8));
        }
             
             
    }
}