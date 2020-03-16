package array;

import java.util.Scanner;

public class ArrayDemo10 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		// 배열 생성하기
		int[] inputNumber = new int[10];
		// 숫자 10개 입력받아서 배열에 담기
		for (int i = 0; i < 10; i++) {
			System.out.print("숫자를 입력하시오 : ");
			inputNumber[i] = scanner.nextInt();
		}
		// 출력할 값을 담는 변수 만들기
		int prev = 0;
		int next = 0;
		int gap = 0;

		// 인접한 숫자들간의 차이를 계산해서 가장 차이가 큰 숫자와 그 차이를 구하기
		for (int i = 0; i < inputNumber.length - 1; i++) {
			if (gap < Math.abs(inputNumber[i] - inputNumber[i + 1])) {
				gap = Math.abs(inputNumber[i] - inputNumber[i + 1]);
				prev = inputNumber[i];
				next = inputNumber[i + 1];
			}
		}
		
		// Math.abs() 절대값 구하기
		
		/*
		 * for (int i = 0; i < inputNumber.length - 1; i++) {
		 * 		int tempPrev = inputNumber[i];
		 * 		int tempNext = inputNumber[i + 1];
		 * 		int currentGap = Math.abs(tempPrev - tempNext);
		 * 		
		 * 		if (currentgap < Gap) {
		 * 			prev = currentgap;
		 * 			next = currentNext;
		 * 			gap = currentGap;
		 * 			}
		 * 		}
		 */
		// 결과 출력하기
		System.out.println("가장 차이가 큰 숫자 : " + prev + "," + next + ", 차이 : " + gap);
	}
}
