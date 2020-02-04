/*
<SW 1966>
주어진 N 길이의 숫자열을 오름차순으로 정렬하여 출력하라.

[제약 사항]

N 은 5 이상 50 이하이다.


[입력]

가장 첫 줄에는 테스트 케이스의 개수 T가 주어지고, 그 아래로 각 테스트 케이스가 주어진다.

각 테스트 케이스의 첫 번째 줄에 N 이 주어지고, 다음 줄에 N 개의 숫자가 주어진다.
 */
package mini.mani.mo;

import java.util.Arrays;
import java.util.Scanner;

public class Solution1966 {
// public class Solution {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		// 전체적인 반복 횟수
		int repeat = sc.nextInt();
		
		for (int i = 1; i <= repeat; i++) {
			// 입력받을 숫자의 갯수 만큼 배열 생성 
			int[] numbers = new int[sc.nextInt()];
			for (int j = 0; j < numbers.length; j++) {
				// 배열에 넣어 준다.
				numbers[j] = sc.nextInt();
			}
			
			Arrays.sort(numbers);
			
			System.out.printf("#%d ", i);
			System.out.println(Arrays.toString(numbers).substring(1, Arrays.toString(numbers).length() - 1).replace(",", ""));
			
		}
	}
}
