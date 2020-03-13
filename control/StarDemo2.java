package control;

public class StarDemo2 {

	public static void main(String[] args) {
		/*
		 
		 **					i=1 -> 2
		 ****				i=2 -> 4
		 ******				i=3 -> 6
		 ********			i=4 -> 8
		 **********			i=5 -> 10
		  
		 */

		for (int i = 1; i <= 5; i++) {
			for (int j = 1; j <= i * 2; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
}
