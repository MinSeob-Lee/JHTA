package control;

import java.util.Scanner;

public class WhileDemo3 {

	public static void main(String[] args) {
		// 1~100까지 임의의 정수를 하나 생성한다.
		// 사용자가 입력한 숫자와 임의의 정수를 비교해서 up/down을 표시한다.
		// 사용자가 입력한 숫자와 정수가 임의의 정수가 일치하면
		// 몇번 안에 맞췄는지 화면 안에 표시한다.

		Scanner scanner = new Scanner(System.in);

		// 1 ~ 100 범위의 임의의 정수를 생성해서 secretNumber에 저장한다.
		int secretNumber = (int) (Math.random() * 100 + 1);
		
		// 사용자가 정답을 맞추기 위해서 숫자를 입력한 횟수
		int inputCount = 0;

		while (true) {
			System.out.print("숫자를 입력해주세요 : ");
			int answer = scanner.nextInt();
			inputCount++;
			// answer과 secretNumber를 비교해서 일치하면 반복문 탈출
			// 								 그렇지 않으면 두 수를 비교해서 UP/DOWN을 출력하고,
			// 								 숫자 입력한 횟수도 1 증가 시킨다.
			if (answer == secretNumber) {
				System.out.println("정답입니다.");
				break;
			} else if (answer > secretNumber) {
				System.out.println("["+answer+"]보다 큽니다.");
			} else if (answer < secretNumber) {
				System.out.println("["+answer+"]보다 작습니다.");
			}
		}
		System.out.println("정답 : " + secretNumber + " 입력횟수 : " + inputCount);
	}
}
