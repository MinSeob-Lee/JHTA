package array;

import java.util.Scanner;

public class ArrayDemo11 {

	public static void main(String[] args) {
		/*
		 * 숫자 5개를 입력받아서 배열에 저장한다. 
		 * 배열의 n번째까지의 합계를 새로운 배열에 저장하고, 새 배열의 값을 전부 출력한다. 
		 * 예) [3, 5, 11, 7, 4] ---> [3, 8, 19, 26, 30]
		 */

		Scanner scanner = new Scanner(System.in);
		
		int[] inputNumber = new int[5];
		int[] inputNumberSum = new int[5];
		int sum = 0;

		for (int i = 0; i < inputNumber.length; i++) {
			System.out.print("숫자를 입력하세요 : ");
			inputNumber[i] = scanner.nextInt();
			sum += inputNumber[i];
			inputNumberSum[i] = sum;
		}
		
		// 반복문을 두개 사용해서 풀 수도 있음.
		
		for (int sumEx : inputNumberSum) {
			System.out.print(sumEx + " ");
		}
	}
}
