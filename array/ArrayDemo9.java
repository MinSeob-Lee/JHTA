package array;

import java.util.Scanner;

public class ArrayDemo9 {

	public static void main(String[] args) {
		/*
		 * 숫자를 10개 입력받아서 그 중에 짝수들의 합계만 구해서 출력하기
		 */

		Scanner scanner = new Scanner(System.in);
		int[] inputNumber = new int[10];
		int sum = 0;

		for (int i = 0; i < 10; i++) {
			System.out.print("숫자를 입력하시오 : ");
			inputNumber[i] = scanner.nextInt();

			if (inputNumber[i] % 2 == 0) {
				sum += inputNumber[i];
			}
		}
		
		/*
		 * enhanced-for문 사용법
		 * int sum = 0;
		 * for (int num : numbers) {
		 * 		if (num % 2 == 0) {
		 * 			total += num;
		 * 		}
		 * 	}
		 */
		
		System.out.println("총합 : " + sum);
	}
}
