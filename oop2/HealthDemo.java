package oop2;

public class HealthDemo {

	public static void main(String[] args) {
		Health h = new Health();

		double result = h.bmi(138, 1.85);
		System.out.println("bmi 지수 : " + result);

		String result2 = h.bmiText(138, 1.85);
		System.out.println("bmi 등급 : " + result2);
	}
}
