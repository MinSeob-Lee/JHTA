package datatype;

public class DataTypeDemo7 {

	public static void main(String[] args) {
		// 변수 활용하기
		/*
		 * 본인의 이름, 전화번호, 이메일, 나이, 키, 몸무게, 혈액형, 결혼여부를
		 * 저장하는 변수를 선언하고 해당값을 각 변수에 저장하기
		 * 
		 * 각 변수에 저장된 값을 출력하기
		 */
		
		String name = "이민섭";
		String phoneNumber = "010-4899-0653";
		String email = "minsub625@naver.com";
		int age = 27;
		int height = 174;
		int weight = 75;
		String bloodType = "Rh+O";
		boolean marriage = false;
		
		System.out.println("이름 : " + name);
		System.out.println("전화번호 : " + phoneNumber);
		System.out.println("이메일 : " + email);
		System.out.println("나이 : " + age + "세");
		System.out.println("키 : " + height + "cm");
		System.out.println("몸무게 : " + weight + "kg");
		System.out.println("혈액형 : " + bloodType);
		System.out.println("결혼여부 : " + marriage);
	}

}
