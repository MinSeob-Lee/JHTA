package control;

public class StarDemo5 {

	public static void main(String[] args) {
		
		/*
		 												공백갯수(5-i에 대한 절대값)
		 	    **			i=1		공백4 별2				5-1 = 4
		 	   ****			i=2		공백3 별4				5-2 = 3
		      ******		i=3		공백2 별6				5-3 = 2
		     ********		i=4		공백1 별8				5-4 = 1
		    **********		i=5		공백0 별10			5-5 = 0
		     ********		i=6		공백1 별8				5-6 = -1
		      ******		i=7		공백2 별6				5-7 = -2
		       ****			i=8		공백3 별4				5-8 = -3
		        **			i=9		공백4 별2				5-9 = -4
		 */
		
		for (int i = 1; i <= 9; i++) {
			int space = i < 5 ? 5 - i : i - 5;
			// case.1
			// if (i <= 5) {
			//		space = 5 - i;
			//	} else {
			//		space = (5 - i) * -1;
			
			// case.2
			// int space = Math.abs(5-i);
			int star = 10 - space * 2;
			
			for (int j = 1; j <= space; j++) {
				System.out.print(" ");
			}
			for (int k = 1; k <= star; k++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
}
