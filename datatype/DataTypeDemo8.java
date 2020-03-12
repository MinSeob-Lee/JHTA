package datatype;

public class DataTypeDemo8 {

	public static void main(String[] args) {
		// 반지름의 길이가 5, 10, 20인 원들이 있다.
		// 각 원들의 넓이와 원의 둘레길이를 계산해서 출력하기
		// 넓이는 3.14 * 반지름 * 반지름, 둘레길이는 2 * 3.14 * 반지름

		int radius1 = 5;
		int radius2 = 10;
		int radius3 = 20;

		/*
		System.out.println("첫 번째 원의 넓이 : " + (3.14 * radius1 * radius1) + ", 둘레길이 : " + (2 * 3.14 * radius1));
		System.out.println("두 번째 원의 넓이 : " + (3.14 * radius2 * radius2) + ", 둘레길이 : " + (2 * 3.14 * radius2));
		System.out.println("세 번째 원의 넓이 : " + (3.14 * radius3 * radius3) + ", 둘레길이 : " + (2 * 3.14 * radius3));
		*/
		
		double circle1Area = Math.PI * radius1 * radius1;
		double circle2Area = Math.PI * radius2 * radius2;
		double circle3Area = Math.PI * radius3 * radius3;
		
		double circle1Round = 2 * Math.PI * radius1;
		double circle2Round = 2 * Math.PI * radius2;
		double circle3Round = 2 * Math.PI * radius3;
		
		System.out.println("반지름 5인 원의 넓이 : " + circle1Area + " 둘레길이 : " + circle1Round);
		System.out.println("반지름 10인 원의 넓이 : " + circle2Area + " 둘레길이 : " + circle2Round);
		System.out.println("반지름 20인 원의 넓이 : " + circle3Area + " 둘레길이 : " + circle3Round);
	}

}
