package oop2;

import java.text.DecimalFormat;

public class MyUtils {

	public static String numberwithComma(long number) {
		DecimalFormat df = new DecimalFormat("#,###");
		return df.format(number);
	}
}
