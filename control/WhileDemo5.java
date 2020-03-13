package control;

public class WhileDemo5 {

	public static void main(String[] args) {

		// 1 + (-2) + 3 + (-4) + 5 + ... 몇까지 더하면 총합이 100 이상이 되는지 구하기

		int sum = 0;
		int number = 1;
		
		while(true) {
			// number의 값이 홀수면 sum에 그냥 더하고, 아니면 -1을 곱한 후 더한다.
			// sum의 값이 100 이상이면 탈출한다.
			// number의 값을 1증가시킨다.

			if (number % 2 == 0) {
				sum += number * -1;
			} else {
				sum += number;
			}
			if (sum >= 100) {
				break;
			}
			number++;
		}
		System.out.println("100 이상이 되는 첫번째 숫자 : " + number);
	}
}
