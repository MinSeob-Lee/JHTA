package control;

import java.util.Scanner;

public class IfDemo4 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		/*
		 * 고객의 등급(일반, 로얄, 플래티넘 중 하나)과 총구매금액을 입력받는다.
		 * 고객의 등급이 플래티넘인 경우 구매금액의 10%를 할인한다.
		 * 			   로얄인 경우 구매금액의 3%를 할인한다.
		 * 			   일반인 경우 구매금액의 1%를 할인한다.
		 * 결제금액은 총구매금액에서 할인된 금액만큼을 차감한 금액이다.
		 * 적립포인트는 결제금액의 3%를 적립한다.
		 * 
		 * 출력내용은 
		 * 		총구매금액, 고객등급, 할인된 금액, 결제할 금액, 적립된 포인트
		 */
		
		System.out.print("고객님의 등급을 입력해주세요(일반, 로얄, 플래티넘) : ");
		String customerGrade = scanner.nextLine();
		System.out.print("총구매금액을 입력해주세요 : ");
		int totalPrice = scanner.nextInt();
		
		int discount = 0;
		int chargePrice = 0;
		int savePoint = 0;
		
		if (customerGrade.equals("플래티넘")) {
			discount = (int) (totalPrice * 0.1);
		} else if (customerGrade.equals("로얄")) {
			discount = (int) (totalPrice * 0.03);
		} else if (customerGrade.equals("일반")) {
			discount = (int) (totalPrice * 0.01);
		}
			
		chargePrice = totalPrice - discount;
		savePoint = (int) (chargePrice * 0.03);
		
		System.out.println("총구매금액 : " + totalPrice);
		System.out.println("고객등급 : " + customerGrade);
		System.out.println("할인된 금액 : " + discount);
		System.out.println("결제할 금액 : " + chargePrice);
		System.out.println("적립된 포인트 : " + savePoint);
	}
}
