package operator;

import java.util.Scanner;

public class ScannerDemo3 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		/*
		 * 고객명, 상품명, 가격, 구매수량, 사용포인트를 입력받는다.
		 * 	출력내용
		 * 		고객명, 상품명, 가격, 구매수량, 구매가격, 사용포인트, 결제금액, 적립포인트
		 * 			* 사용포인트는 고객이 이미 적립한 포인트가 있다고 가정하고, 임의의 값을 입력받는다.
		 * 			* 결제금액은 구매가격에서 포인트 사용량을 제외한 금액이다.
		 * 			* 적립포인트는 실결제금액의 3%다.
		 */
		
		System.out.print("성함을 입력하세요 : ");
		String name = scanner.nextLine();
		System.out.print("상품명을 입력하세요 : ");
		String productName = scanner.nextLine();
		System.out.print("가격을 입력하세요 : ");
		int price = scanner.nextInt();
		System.out.print("구매수량을 입력하세요 : ");
		int productAccount = scanner.nextInt();
		System.out.print("사용포인트를 입력하세요 : ");
		int usePoint = scanner.nextInt();
		
		int totalPrice = price * productAccount;
		int chargePrice = totalPrice - usePoint;
		int savePoint = (int) (chargePrice * 0.03);
		
		System.out.println("고 객 명 : " + name);
		System.out.println("상 품 명 : " + productName);
		System.out.println("가    격 : " + price);
		System.out.println("구매수량 : " + productAccount);
		System.out.println("구매가격 : " + totalPrice);
		System.out.println("사용포인트 : " + usePoint);
		System.out.println("결제금액 : " + chargePrice);
		System.out.println("적립포인트 : " + savePoint);
	}
}
