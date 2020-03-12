package control;

public class Lotto3 {

	public static void main(String[] args) {
		int n1 = 0; // 첫번째 로또번호
		int n2 = 0; // 두번째 로또번호
		int n3 = 0; // 세번째 로또번호
		int n4 = 0; // 네번째 로또번호
		int n5 = 0; // 다섯번째 로또번호
		int n6 = 0; // 여섯번째 로또번호

		for (int i = 1; i <= 6; i++) {
			int num = (int) (Math.random() * 45 + 1);
			// num이 n1과 일치하거나 n2와 일치하거나... n6과 일치하면(OR결합)
			// 지금 발행된숫자와 동일한 숫자가 이미 존재하고 있음
			if (num == n1 || num == n2 || num == n3 || num == n4 || num == n5 || num == n6) {
				i--;
			} else {
				if (i == 1) {
					n1 = num;
				} else if (i == 2) {
					n2 = num;
				} else if (i == 3) {
					n3 = num;
				} else if (i == 4) {
					n4 = num;
				} else if (i == 5) {
					n5 = num;
				} else if (i == 6) {
					n6 = num;
				}
			} // 지금 발행된 숫자와 동일한 숫자가 존재하지 않음
			  // i의 값에 따라서 적절한 변수에 지금 발행된 난수를 저장한다.
			System.out.println("["+i+"]" + num + "======>" + n1 + " " + n2 + " " + n3 + " " + n4 + " " + n5 + " " + n6);
		}
		System.out.println(n1 + " " + n2 + " " + n3 + " " + n4 + " " + n5 + " " + n6);
	}
}
