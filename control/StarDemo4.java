package control;

public class StarDemo4 {

	public static void main(String[] args) {
		/*
		 	    **			i=1		공백4 별2
		 	   ****			i=2		공백3 별4
		      ******		i=3		공백2 별6
		     ********		i=4		공백1 별8
		    **********		i=5		공백0 별10
		 
		 */
		
		for (int i = 1; i <= 5; i++) {
			// for (int j = 1; j <= (10 - i * 2) / 2; j++)
			for (int j = 1; j <= 5 - i; j++) {
				System.out.print(" ");
			}
			for (int k = 1; k <= i * 2; k++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
}
